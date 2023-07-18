import 'package:chrome_apis/tabs.dart';
import 'package:test/test.dart';
import 'package:checks/checks.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/action.dart';

void main() => setup(_tests);

void _tests() {
  test('title -- global', () async {
    var title = 'test title';
    var details = SetTitleDetails(title: title);
    await chrome.action.setTitle(details);
    var actual = await chrome.action.getTitle(TabDetails());
    check(actual).equals(title);

    var originalTitle = "chrome_ext.dart - test";
    var originalTitleDetails = SetTitleDetails(title: originalTitle);
    await chrome.action.setTitle(originalTitleDetails);
    actual = await chrome.action.getTitle(TabDetails());
    check(actual).equals(originalTitle);
  });

  test('title -- tab', () async {
    var title = 'test title';
    var tab = await chrome.tabs.create(CreateProperties());
    var details = SetTitleDetails(title: title, tabId: tab.id);

    await chrome.action.setTitle(details);
    var getTitleDetails = TabDetails(tabId: tab.id);
    await chrome.action.getTitle(getTitleDetails);
    var originalTitle = "chrome_ext.dart - test";
    var originalTitleDetails =
        SetTitleDetails(title: originalTitle, tabId: tab.id);
    await chrome.action.setTitle(originalTitleDetails);

    var getOriginalTitleDetails = TabDetails(tabId: tab.id);
    var actual = await chrome.action.getTitle(getOriginalTitleDetails);
    expect(actual, equals(originalTitle));
  });
/*
  test('badge text -- global', () {
    String badgeText = '9999';
    chrome.BrowserActionSetBadgeTextParams details =
        new chrome.BrowserActionSetBadgeTextParams(text: badgeText);
    chrome.browserAction.setBadgeText(details);

    chrome.BrowserActionGetBadgeTextParams getBadgedetails =
        new chrome.BrowserActionGetBadgeTextParams();
    chrome.browserAction
        .getBadgeText(getBadgedetails)
        .then(expectAsync((String actual) {
      expect(actual, equals(badgeText));
    }));

    chrome.BrowserActionSetBadgeTextParams clearBadgedetails =
        new chrome.BrowserActionSetBadgeTextParams(text: '');
    chrome.browserAction.setBadgeText(clearBadgedetails);
    chrome.browserAction
        .getBadgeText(getBadgedetails)
        .then(expectAsync((String actual) {
      expect(actual, equals(''));
    }));
  });

  test('badge text -- tab', () {
    String badgeText = '9999';
    chrome.tabs.getCurrent().then(expectAsync((chrome.Tab tab) {
      chrome.BrowserActionSetBadgeTextParams details =
          new chrome.BrowserActionSetBadgeTextParams(
              text: badgeText, tabId: tab.id);
      chrome.browserAction.setBadgeText(details);

      chrome.BrowserActionGetBadgeTextParams getBadgeDetails =
          new chrome.BrowserActionGetBadgeTextParams(tabId: tab.id);
      chrome.browserAction
          .getBadgeText(getBadgeDetails)
          .then(expectAsync((String actual) {
        expect(actual, equals(badgeText));
      }));

      chrome.BrowserActionSetBadgeTextParams clearBadgedetails =
          new chrome.BrowserActionSetBadgeTextParams(text: '', tabId: tab.id);
      chrome.browserAction.setBadgeText(clearBadgedetails);
      chrome.browserAction
          .getBadgeText(getBadgeDetails)
          .then(expectAsync((String actual) {
        expect(actual, equals(''));
      }));
    }));
  });

  test('badge background color -- global', () {
    chrome.BrowserActionSetBadgeBackgroundColorParams badgeColor =
        new chrome.BrowserActionSetBadgeBackgroundColorParams(
            color: [192, 134, 76, 255]);
    chrome.BrowserActionSetBadgeBackgroundColorParams originalColor =
        new chrome.BrowserActionSetBadgeBackgroundColorParams(
            color: [0, 0, 0, 0]);

    chrome.browserAction.setBadgeBackgroundColor(badgeColor);
    chrome.browserAction
        .getBadgeBackgroundColor(
            new chrome.BrowserActionGetBadgeBackgroundColorParams())
        .then(expectAsync((chrome.ColorArray actual) {
      expect(actual.toJs()[0], equals(badgeColor.color[0]));
      expect(actual.toJs()[1], equals(badgeColor.color[1]));
      expect(actual.toJs()[2], equals(badgeColor.color[2]));
      expect(actual.toJs()[3], equals(badgeColor.color[3]));
    }));

    chrome.browserAction.setBadgeBackgroundColor(originalColor);
    chrome.browserAction
        .getBadgeBackgroundColor(
            new chrome.BrowserActionGetBadgeBackgroundColorParams())
        .then(expectAsync((chrome.ColorArray actual) {
      expect(actual.toJs()[0], equals(originalColor.color[0]));
      expect(actual.toJs()[1], equals(originalColor.color[1]));
      expect(actual.toJs()[2], equals(originalColor.color[2]));
      expect(actual.toJs()[3], equals(originalColor.color[3]));
    }));
  });

  test('badge background color -- tab', () {
    chrome.tabs.getCurrent().then(expectAsync((chrome.Tab tab) {
      chrome.BrowserActionSetBadgeBackgroundColorParams badgeColor =
          new chrome.BrowserActionSetBadgeBackgroundColorParams(
              color: [192, 134, 76, 255], tabId: tab.id);
      chrome.BrowserActionSetBadgeBackgroundColorParams originalColor =
          new chrome.BrowserActionSetBadgeBackgroundColorParams(
              color: [0, 0, 0, 0], tabId: tab.id);

      chrome.browserAction.setBadgeBackgroundColor(badgeColor);
      chrome.browserAction
          .getBadgeBackgroundColor(
              new chrome.BrowserActionGetBadgeBackgroundColorParams(
                  tabId: tab.id))
          .then(expectAsync((chrome.ColorArray actual) {
        expect(actual.toJs()[0], equals(badgeColor.color[0]));
        expect(actual.toJs()[1], equals(badgeColor.color[1]));
        expect(actual.toJs()[2], equals(badgeColor.color[2]));
        expect(actual.toJs()[3], equals(badgeColor.color[3]));
      }));
      chrome.browserAction.setBadgeBackgroundColor(originalColor);
      chrome.browserAction
          .getBadgeBackgroundColor(
              new chrome.BrowserActionGetBadgeBackgroundColorParams(
                  tabId: tab.id))
          .then(expectAsync((chrome.ColorArray actual) {
        expect(actual.toJs()[0], equals(originalColor.color[0]));
        expect(actual.toJs()[1], equals(originalColor.color[1]));
        expect(actual.toJs()[2], equals(originalColor.color[2]));
        expect(actual.toJs()[3], equals(originalColor.color[3]));
      }));
    }));
  });

  test('popup -- global', () {
    String popupFile = "sample.html";
    chrome.BrowserActionSetPopupParams popupParams =
        new chrome.BrowserActionSetPopupParams(popup: popupFile);
    chrome.browserAction.setPopup(popupParams);
    chrome.BrowserActionGetPopupParams getPopupParams =
        new chrome.BrowserActionGetPopupParams();
    chrome.browserAction
        .getPopup(getPopupParams)
        .then(expectAsync((String actual) {
      expect(actual, endsWith(popupFile)); // adds extension prefix
    }));

    chrome.BrowserActionSetPopupParams clearPopupParams =
        new chrome.BrowserActionSetPopupParams(popup: "");
    chrome.browserAction.setPopup(clearPopupParams);
    chrome.browserAction
        .getPopup(getPopupParams)
        .then(expectAsync((String actual) {
      expect(actual, equals(""));
    }));
  });

  test('popup -- tab', () {
    String popupFile = "sample.html";
    chrome.tabs.getCurrent().then(expectAsync((chrome.Tab tab) {
      chrome.BrowserActionSetPopupParams popupParams =
          new chrome.BrowserActionSetPopupParams(
              popup: popupFile, tabId: tab.id);

      chrome.BrowserActionSetPopupParams clearPopupParams =
          new chrome.BrowserActionSetPopupParams(popup: "", tabId: tab.id);

      chrome.BrowserActionGetPopupParams getPopupParams =
          new chrome.BrowserActionGetPopupParams(tabId: tab.id);

      chrome.browserAction.setPopup(popupParams);
      chrome.browserAction
          .getPopup(getPopupParams)
          .then(expectAsync((String actual) {
        expect(actual, endsWith(popupFile)); // adds extension prefix
      }));
      chrome.browserAction.setPopup(clearPopupParams);
      chrome.browserAction.getPopup(getPopupParams).then(expectAsync((actual) {
        expect(actual, equals(""));
      }));
    }));
  });

  test('disable/enable -- global', () {
    chrome.browserAction.disable();
    chrome.browserAction.enable();
    // TODO(DrMarcII): need to figure out a way to check if this is working.
  });

  test('disable/enable -- tab', () {
    chrome.tabs.getCurrent().then(expectAsync((chrome.Tab tab) {
      chrome.browserAction.disable(tab.id);
      chrome.browserAction.enable(tab.id);
    }));
    // TODO(DrMarcII): need to figure out a way to check if this is working.
  });

  test('onClicked', () {
    chrome.browserAction.onClicked.listen((_) {}).cancel();
    // TODO(DrMarcII): need to figure out a way to fire this event.
  });

 */"";
}
