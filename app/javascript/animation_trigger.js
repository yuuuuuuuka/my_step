$(document).on('turbolinks:load', function () {
  $('#new_user').on('submit', function (event) {
    event.preventDefault(); // フォームのデフォルト送信を阻止

    // フォームデータを取得し、Ajaxで送信
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json'
    })
      .done(function (data) {
        // サーバーから成功レスポンスを受け取った場合

        // 画像を表示
        $('#animation-area').fadeIn(500);

        // 画像を数秒間表示してからページ遷移
        setTimeout(function () {
          $('#animation-area').fadeOut(500, function () {
            // ページ遷移 (例: indexページにリダイレクト)
            window.location.href = '/index';
          });
        }, 2000); // 2秒後に遷移
      })
      .fail(function (jqXHR, textStatus, errorThrown) {
        // サーバーからエラーレスポンスを受け取った場合
        // エラーメッセージを表示する処理
        console.error(errorThrown);
        // 例: $('#error-message').text(jqXHR.responseJSON.error);

      });
  });
});
