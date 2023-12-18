function defaultFunc() {
    function show__posts() {
        fetch('../backend/index.php?controller=new')
            .then(response => response.json())
            .then(data => {
                console.log(data)
                var news__info = document.querySelector('.news__info').cloneNode(true)
                document.querySelector('.news__info').remove()
                data = data.sort((a,b)=>{
                    return b.id-a.id
                })
                data.slice(1,5).forEach(item => {
                    var news__infoClone = news__info.cloneNode(true)
                    news__infoClone.querySelector('img').src = item.img
                    news__infoClone.querySelector('img').parentNode.href = 'post.html?id='+item.id
                    news__infoClone.querySelector('.cat-btn').href = 'posts.html?cat='+item.category_id
                    news__infoClone.querySelector('.cat-btn').textContent = item.category
                    news__infoClone.querySelector('h3 a').href = 'post.html?id='+item.id
                    news__infoClone.querySelector('h3 a').textContent = item.title
                    news__infoClone.querySelector('.list-inline a').textContent = item.author
                    document.querySelector('.news__list').appendChild(news__infoClone)
                });

                document.querySelector('.first__img img').src = data[0].img
                document.querySelector('.first__img').href = 'post.html?id='+data[0].id
                document.querySelector('.first__category').href = 'posts.html?cat='+data[0].category_id
                document.querySelector('.first__category').textContent = data[0].category
                document.querySelector('.first__title').textContent = data[0].title
                document.querySelector('.first__author').textContent = data[0].author
                document.querySelector('.first__views').textContent = data[0].views

            })
    }

    // thực thi hàm 
    show__posts()
}

document.addEventListener('DOMContentLoaded', () => {
    defaultFunc()
})