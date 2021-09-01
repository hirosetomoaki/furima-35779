document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list')
    
    const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      
      let imageElementNum = document.querySelectorAll('.image-element').length

      // 表示する画像を生成
      const blobImage = document.createElement('img')
      blobImage.setAttribute('class', "p-images")
      blobImage.setAttribute('width', 300)
      blobImage.setAttribute('src', blob)

      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)
      

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById('item-image').addEventListener('change', (e) => {
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('.p-images');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });

    document.getElementById('edit-image-0').addEventListener('change', (e) => {
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const edit = document.getElementById("image-0")
      edit.src = blob
    });

    document.getElementById('edit-image-1').addEventListener('change', (e) => {
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const edit = document.getElementById("image-1")
      edit.src = blob
    });

    document.getElementById('edit-image-2').addEventListener('change', (e) => {
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const edit = document.getElementById("image-2")
      edit.src = blob
    });
  }
});