function defaultFunc() {
    function show__posts() {
        fetch('../backend/index.php?controller=new')
            .then(response => response.json())
            .then(data => {
                var cat = new URLSearchParams(window.location.search).get('cat')
                var query = new URLSearchParams(window.location.search).get('q')

                // in ra cài bài viết phần chính 
                var news__info = document.querySelector('.news__info').cloneNode(true)
                document.querySelector('.news__list').innerHTML = ''
                if (cat) {
                    data = data.filter(item => {
                        return item.category_id == cat
                    })
                } else if (query) {
                    data = data.filter(item => {
                        console.log(item.title.toLowerCase().includes(query.toLowerCase()))
                        return item.title.toLowerCase().includes(query.toLowerCase())
                    })
                    document.querySelector('.posts__title').textContent = 'Từ khóa: '+ query
                } else {
                    window.location.href = 'index.html'
                }


                data.forEach(item => {
                    var news__infoClone = news__info.cloneNode(true)
                    news__infoClone.querySelector('a.post-cat').textContent = item.category
                    news__infoClone.querySelector('.axil-post-title a').textContent = item.title
                    news__infoClone.querySelector('.views').textContent = item.views
                    news__infoClone.querySelector('.author').textContent = item.author
                    news__infoClone.querySelector('.axil-post-title a').href = 'post.html?id=' + item.id
                    news__infoClone.querySelector('img').src = item.img
                    document.querySelector('.news__list').appendChild(news__infoClone)
                });

                // in ra các bài viết mới đăng 
                var recent__info = document.querySelector('.recent__info').cloneNode(true)
                document.querySelector('.recent__info').remove()
                data.sort((a, b) => {
                    return b.id - a.id
                }).slice(0, 4).forEach(item => {
                    var recent__infoClone = recent__info.cloneNode(true)
                    recent__infoClone.querySelector('img').src = item.img
                    recent__infoClone.querySelector('h4 a').textContent = item.title
                    recent__infoClone.querySelector('h4 a').href = 'post.html?id=' + item.id
                    recent__infoClone.querySelector('.color-blue-three').textContent = item.category
                    recent__infoClone.querySelector('.color-blue-three').href = 'posts.html?cat=' + item.category_id
                    recent__infoClone.querySelector('.author').textContent = item.author
                    document.querySelector('.recent__list').appendChild(recent__infoClone)
                })

                // in ra các bài viết được quan tâm 
                var popular__info = document.querySelector('.popular__info').cloneNode(true)
                document.querySelector('.popular__info').remove()
                data.sort((a, b) => {
                    return b.views - a.views
                }).slice(0, 4).forEach(item => {
                    var popular__infoClone = popular__info.cloneNode(true)
                    popular__infoClone.querySelector('img').src = item.img
                    popular__infoClone.querySelector('h4 a').textContent = item.title
                    popular__infoClone.querySelector('h4 a').href = 'post.html?id=' + item.id
                    popular__infoClone.querySelector('.color-blue-one').textContent = item.category
                    popular__infoClone.querySelector('.color-blue-one').href = 'posts.html?cat=' + item.category_id
                    popular__infoClone.querySelector('.author').textContent = item.author
                    document.querySelector('.popular__list').appendChild(popular__infoClone)
                })
            })
    }

    // thực thi hàm 
    show__posts()
}

document.addEventListener('DOMContentLoaded', () => {
    defaultFunc()
})