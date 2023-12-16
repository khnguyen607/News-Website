document.addEventListener('DOMContentLoaded', () => {
	fetch('layout.html')
		.then(response => response.text())
		.then(data => {
			var div = document.createElement('div')
			div.innerHTML = data
			document.querySelector('.header__top').innerHTML = div.querySelector('.header__top').innerHTML
			document.querySelector('header.page-header').innerHTML = div.querySelector('header.page-header').innerHTML
			document.querySelector('footer.page-footer').innerHTML = div.querySelector('footer.page-footer').innerHTML
		})
})