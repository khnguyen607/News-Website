function defaultFunc() {
    // lấy dữ liệu cho phần widget 
    function show__posts() {
        fetch('../backend/index.php?controller=new')
            .then(response => response.json())
            .then(data => {
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

    // Đổ dữ liệu ra bài viết hiện tại
    var id = new URLSearchParams(window.location.search).get('id')
    fetch('../backend/index.php?controller=new&action=incViews&id='+id)
    document.querySelector('.comment-form').action = '../backend/index.php?controller=comment&action=addComment&new_id='+ id
    function show__post() {
        fetch('../backend/index.php?controller=new&action=findNew&id=' + id)
            .then(response => response.json())
            .then(data => {
                document.querySelector('.post__category').textContent = data.category
                document.querySelector('.post__title').textContent = data.title
                document.querySelector('.post__views').textContent = data.views
                document.querySelector('.post__author').textContent = data.author
                document.querySelector('.post__content').innerHTML = data.content
                document.querySelector('.post__img').src = data.img
            })
    }

    // đổ dữ liệu bình luận của bài viết 
    function show__cmt() {
        fetch('../backend/index.php?controller=comment&action=getinNew&id=' + id)
            .then(response => response.json())
            .then(data => {
                var cmt__info = document.querySelector('.cmt__info').cloneNode(true)
                document.querySelector('.cmt__info').remove()
                document.querySelector('.cmt__count').textContent = data.length
                data.forEach(item => {
                    var cmt__infoClone = cmt__info.cloneNode(true)
                    cmt__infoClone.querySelector('.cmt__user').textContent = item.user
                    cmt__infoClone.querySelector('.cmt__content').textContent = item.content
                    document.querySelector('.cmt__list').appendChild(cmt__infoClone)
                })
            })
    }

    // thực thi hàm 
    show__post()
    show__posts()
    show__cmt()
}

document.addEventListener('DOMContentLoaded', () => {
    defaultFunc()
})