#日付の取得

# macos
date=`date -v+1d '+%Y-%m-%d'`
date_dir=`date -v+1d '+%Y-%m/%d'`
# linux
# date=`date -d '1 days'` '+%Y-%m-%d'`
# date_dir=`date -d '1 days'` '+%Y-%m/%d'`

# 開催日のdirを作成
mkdir -p $date_dir

json=`curl -X POST https://graph.facebook.com/${WP_GROUP_ID}/feed \
    -H 'Content-Type: application/json' \
    -H "Authorization: Bearer ${WP_TOKEN}" \
    -d @- <<EOS
    {
        "message":"# 🏀初参加の方も大歓迎、明日バスケやります🏀\n${date}(火)に第四日野小学校でバスケをやります！\nスタンプで明日の予定を教えてください🙇\n* 👍(青のLike)18:40~に2階エントランスに集合していく！\n* ❤️(Love)19:00~に2階エントランスに集合していく！\n* 😆(haha)遅れるけど参加！\n* 😭(sad):今日は参加できない...\n\n スタンプで参加教えてくれた方は直前に声掛けします〜", 
        "formatting":"MARKDOWN"
    }
EOS`

weeweekly_notify_id=`echo $json | jq .id | awk -F'[_"]' '{print $3}'`
echo "weeweekly_notify_id=$weeweekly_notify_id" > ./$date_dir/text.txt

# echo $weeweekly_notify_id  > test.txt

    # '{"message":"# 明日バスケやります！<br>\18:40~に2階エントランスに集合@[100092644071933]", "formatting":"MARKDOWN"}' | jq .

# curl -X GET https://graph.facebook.com/1245844919630938/comments \
#     -H 'Content-Type: application/json' \
#     -H "Authorization: Bearer DQVJ0S1k3NWZACd0hScDFMeVBoaWFManh4cTRhVGVsRDBqbEJmdUJRMnRPb19LcERESlpRVzBtVjNDZAnl6ZA0F3c2ZA0TGRDUkdjbTFwWkF0Um5rNVV1MVZAWNXhBdmZA4blF6WXZAUYXJjLS1VT2pWbkp6eHdkYzEzWnJpWjJZASURIam1HemhURDBhS3pkV05rTFJVMHlscHdST0h5QlVrcnpCSjhoXzkydzBGQ2RqNGN6TTgzc092RU4tMFBMOWhubWRTZA0g4VkVB" \

# curl -X GET "https://graph.facebook.com/1245851782963585" \
#     -H 'Content-Type: application/json' \
#     -H "Authorization: Bearer DQVJ0S1k3NWZACd0hScDFMeVBoaWFManh4cTRhVGVsRDBqbEJmdUJRMnRPb19LcERESlpRVzBtVjNDZAnl6ZA0F3c2ZA0TGRDUkdjbTFwWkF0Um5rNVV1MVZAWNXhBdmZA4blF6WXZAUYXJjLS1VT2pWbkp6eHdkYzEzWnJpWjJZASURIam1HemhURDBhS3pkV05rTFJVMHlscHdST0h5QlVrcnpCSjhoXzkydzBGQ2RqNGN6TTgzc092RU4tMFBMOWhubWRTZA0g4VkVB" \
#     -d '{"fields":"poll"}' | jq .

# curl -X GET "https://graph.facebook.com/1245844919630938/?fields=poll" \
#     -H 'Content-Type: application/json' \
#     -H "Authorization: Bearer DQVJ0S1k3NWZACd0hScDFMeVBoaWFManh4cTRhVGVsRDBqbEJmdUJRMnRPb19LcERESlpRVzBtVjNDZAnl6ZA0F3c2ZA0TGRDUkdjbTFwWkF0Um5rNVV1MVZAWNXhBdmZA4blF6WXZAUYXJjLS1VT2pWbkp6eHdkYzEzWnJpWjJZASURIam1HemhURDBhS3pkV05rTFJVMHlscHdST0h5QlVrcnpCSjhoXzkydzBGQ2RqNGN6TTgzc092RU4tMFBMOWhubWRTZA0g4VkVB" | jq .

# curl -X GET "https://graph.facebook.com/1245852719630158/reactions?" \
#     -H 'Content-Type: application/json' \
#     -H "Authorization: Bearer DQVJ0S1k3NWZACd0hScDFMeVBoaWFManh4cTRhVGVsRDBqbEJmdUJRMnRPb19LcERESlpRVzBtVjNDZAnl6ZA0F3c2ZA0TGRDUkdjbTFwWkF0Um5rNVV1MVZAWNXhBdmZA4blF6WXZAUYXJjLS1VT2pWbkp6eHdkYzEzWnJpWjJZASURIam1HemhURDBhS3pkV05rTFJVMHlscHdST0h5QlVrcnpCSjhoXzkydzBGQ2RqNGN6TTgzc092RU4tMFBMOWhubWRTZA0g4VkVB" | jq .

# curl -X POST "https://graph.facebook.com/community/surveys?creation_mode=DRAFT" \
#     -H 'Content-Type: application/json' \
#     -H "Authorization: Bearer DQVJ0S1k3NWZACd0hScDFMeVBoaWFManh4cTRhVGVsRDBqbEJmdUJRMnRPb19LcERESlpRVzBtVjNDZAnl6ZA0F3c2ZA0TGRDUkdjbTFwWkF0Um5rNVV1MVZAWNXhBdmZA4blF6WXZAUYXJjLS1VT2pWbkp6eHdkYzEzWnJpWjJZASURIam1HemhURDBhS3pkV05rTFJVMHlscHdST0h5QlVrcnpCSjhoXzkydzBGQ2RqNGN6TTgzc092RU4tMFBMOWhubWRTZA0g4VkVB" \
#     -d '{"title":"TSurvey5", "questions":[{"question_type":"FREE_TEXT","text":"Q1"},{"question_type": "FREE_TEXT","text": "Q2"}], "scheduling_config":{"start_timestamp": 1629222600,"end_timestamp": 1629223600,"frequency": "ONCE","response_window_days": 7,"audience":1233455666}}' | jq .

# curl -X POST "https://forms.googleapis.com/v1/forms" \
#     -H 'Content-Type: application/json' \
#     -H "Authorization: Bearer AIzaSyCxCjcRXq93OepaIrXb99TxykSoG-RYq9k" \
#     -d '{"info":{"title": "アンケートフォーム","documentTitle": "新規フォーム"}}'| jq .