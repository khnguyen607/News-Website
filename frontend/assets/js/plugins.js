function getCookie(cookieName) {
	var name = cookieName + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var cookieArray = decodedCookie.split(';');
	for (var i = 0; i < cookieArray.length; i++) {
		var cookie = cookieArray[i].trim();
		if (cookie.indexOf(name) === 0) {
			return cookie.substring(name.length, cookie.length);
		}
	}
	return null; // Trả về null nếu không tìm thấy cookie
}

document.addEventListener('DOMContentLoaded', () => {
	fetch('layout.html')
		.then(response => response.text())
		.then(data => {
			var div = document.createElement('div')
			div.innerHTML = data
			document.querySelector('.header__top').innerHTML = div.querySelector('.header__top').innerHTML
			document.querySelector('header.page-header').innerHTML = div.querySelector('header.page-header').innerHTML
			document.querySelector('footer.page-footer').innerHTML = div.querySelector('footer.page-footer').innerHTML

			fetch('../backend/index.php?controller=user&action=findUser&id=' + getCookie('user_id'))
				.then(response => response.json())
				.then(data => {
					document.querySelector('.header__name').textContent = 'Xin chào, ' + data.name
				})

			fetch('../backend/index.php?controller=category')
				.then(response => response.json())
				.then(data => {
					data = data.filter(item => {
						return item.status == '1'
					})
					data.forEach(item => {
						var li = document.createElement('li')
						li.innerHTML = `<a href="posts.html?cat=${item.id}">${item.name}</a>`
						document.querySelectorAll('.category__list').forEach(cat => {
							cat.appendChild(li.cloneNode(true))
						})
					});

					if (window.location.href.includes('/posts.html?cat=')) {
						var cat = new URLSearchParams(window.location.search).get('cat')
						document.querySelector('.posts__title').textContent = document.querySelector(`a[href="posts.html?cat=${cat}"]`).textContent
					}
				})

			if (getCookie('user_id')) {
				document.querySelector('.btn__login').classList.add('d-none')
				document.querySelector('.btn__logout').classList.remove('d-none')
				document.querySelector('.header__name').classList.remove('d-none')
			}

			if (window.location.href.includes('/index.html')) {
				document.querySelector('#main-menu .is-active').classList.remove('is-active')
				document.querySelector('#main-menu .index').classList.add('is-active')
			}
		})
})