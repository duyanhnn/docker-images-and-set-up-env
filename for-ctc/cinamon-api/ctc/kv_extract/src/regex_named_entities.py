# coding=utf-8
import re
import unicodedata

money_format = u"(\(.{2,6}\))?((-|－|\.)?\d(\d|,|\.|')*(億|万|偽)?(円|H)|無制限)(\(.{2,6}\))?"
money_range = u"\d(\d|,|\.|')*(億|万|偽)?(円|H)(一|-|－| |~)(\d(\d|,|\.|')*(億|万|偽)?(円|H)|無制限)"
age_format = u"(\d+(歳(以上補償)?|才)|不限年齡)"
date_format = u"((明治?|大正?|昭和?|平成?|成)?元?\.?(\d+)?(\(\d{6}\))?(\.|年)(\(.{6}\))?\d+(\.|月)(\d+(\.|日))?)"
date_western = u"(\d+年\d+月(\d+日)?)"
date_range_format = u"@dateより@dateまで.{0,4}"
payment_method_format = u"(\d+回払|月払保険料\（1回分\）|月払|(長期)?年払)"
nonfleet_grade_format = u"\d+[A-Z]?(等級|\(等級.?\))(\([A-Z]\))?"
yes_no_format = u"\.?(○|。|－|-|(あ|ぁ)(り|り)|なし|無)"
no_format = u"(○|。|－|-|\.?なし|無)"
car_model = u"[A-Z0-9]+改?"
license_color = u"ゴールド|グリーン|ブルー"
hiragana = u"[\u3040-\u309F]+"
katakana = u"[\u30A0-\u30FF\uFF61-\uFF9F]+"
kanji = u"[\u4E00-\u9FAF]"


# 2016年(十成28年)8月18日國謀諸ー振細啓
def detect_issue_date(list_ocr):
    for l in list_ocr:
        text = unicodedata.normalize("NFKC", unicode(l))
        text = "".join(text.split())
        text = re.sub("\(.+\)", "", text)
        print(text)
        m = re.search(date_format, text)
        if m:
            return m.groups(1)[0]
        m = re.search(date_western, text)
        if m:
            return m.groups(1)[0]
    return ""

print(detect_issue_date([u"2013年8月1"]))
