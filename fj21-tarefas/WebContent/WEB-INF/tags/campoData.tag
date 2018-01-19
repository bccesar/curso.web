<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="value" required="false" %>

<input type="text" id="${id}" name="${id}" value="${value}" />
<script>
	$("#${id}").datepicker({dateFormat: 'dd/mm/yy', changeYear: true, yearRange: '-100:+0'});
</script>
