document.querySelectorAll('.editable').forEach(function (cell) {
  cell.addEventListener('click', function () {
    // すでに編集モードであれば無視
    if (cell.querySelector('input')) return;

    // セルのデータを取得
    const type = cell.getAttribute('data-type');
    const id = cell.getAttribute('data-id');
    const currentValue = cell.textContent.trim();

    // 入力フォームを作成
    const input = document.createElement('input');
    input.type = (type === 'date') ? 'date' : 'number';
    input.value = currentValue;
    input.style.width = "80%"; // セルに合わせて幅を設定
    cell.textContent = ''; // セルの内容をクリアして入力フィールドを追加
    cell.appendChild(input);

    // フォーカスを設定
    input.focus();

    // 編集終了時の処理 (Enterキーやフォーカスを外した時)
    input.addEventListener('blur', function () {
      const newValue = input.value;

      // サーバーに更新データを送信する例
      updateCellData(id, type, newValue);

      // 入力フィールドを通常のテキストに戻す
      cell.textContent = newValue;
    });

    // Enterキーでも編集終了
    input.addEventListener('keydown', function (e) {
      if (e.key === 'Enter') {
        input.blur();
      }
    });
  });
});

// データ更新をサーバーに送信する関数（Ajax）
function updateCellData(id, type, value) {
  fetch(`/weights/${id}`, {
    method: 'PATCH',  // PATCH メソッドを使ってリソースを更新
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    },
    body: JSON.stringify({
      field: type,
      value: value
    })
  }).then(response => {
    return response.json();
  }).then(data => {
    console.log('データが更新されました:', data);
  }).catch(error => {
    console.error('データ更新に失敗しました:', error);
  });
}
