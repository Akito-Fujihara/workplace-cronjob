#日付の取得

# macos
# date=`date -v+1d '+%Y-%m-%d'`
# date_dir=`date -v+1d '+%Y-%m/%d'`
# linux
date=`date -d '1 days' '+%Y-%m-%d'`
date_dir=`date -d '1 days' '+%Y-%m/%d'`

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
