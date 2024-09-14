document.addEventListener("turbo:load", function () {
  const form = document.querySelector('#new_user');

  if (form) {

    form.addEventListener('submit', function (event) {
      // event.preventDefault();
      console.log("フォームが送信されました");
    });
  } else {
    console.log("フォームが見つかりませんでした");
  }
});
