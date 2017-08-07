<img class='logo' src="<%=request.getContextPath() %>/images/logo/logo.png">
<nav class='nav' ng-scrollbar>
	<ul class='nav-menu'>
		<li ui-sref-active='active' ng-repeat='nav in navs'><img alt=""
			ng-src='<%=request.getContextPath() %>/images/icon/{{nav.img}}' /> <a ui-sref='.{{nav.url}}'
			' ng-bind='nav.name'></a></li>
	</ul>
</nav>