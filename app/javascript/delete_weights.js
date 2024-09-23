// 全ての削除ボタンにイベントリスナーを設定
document.querySelectorAll('.weights_delete-btn').forEach(function (button) {
  button.addEventListener('click', function () {
    const id = button.getAttribute('data-id');

    if (confirm('このデータを本当に削除しますか？')) {
      // サーバーに削除リクエストを送信
      deleteWeightData(id).then(() => {
        button.closest('tr').remove();
      }).catch(error => {
        console.error('削除に失敗しました:', error);
        alert('削除に失敗しました。');

      });
    }
  });
});

// データをサーバーに削除リクエストで送信する関数
function deleteWeightData(id) {
  return fetch(`/weights/${id}`, {
    method: 'DELETE',  // DELETE メソッドを使ってリソースを削除
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    }
  }).then(response => {
    if (!response.ok) {
      return response.json().then(error => {
        throw new Error(error.message || '削除に失敗しました');
      });
    }
  });
}
