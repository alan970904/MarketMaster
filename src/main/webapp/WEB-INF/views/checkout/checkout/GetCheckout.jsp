<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>結帳詳細資訊</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/CSS/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/extra.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
</head>
<body>
    <%@ include file="../../body/body.jsp"%>
    <main class="container mt-5">
        <h1 class="mb-4">結帳詳細資訊</h1>
        <table class="table table-bordered checkout-form">
            <tr>
                <th>結帳編號:</th>
                <td>${checkout.checkoutId}</td>
            </tr>
            <tr>
                <th>客戶電話:</th>
                <td>${checkout.customerTel}</td>
            </tr>
            <tr>
                <th>員工編號:</th>
                <td>${checkout.employeeId}</td>
            </tr>
            <tr>
                <th>總價:</th>
                <td>${checkout.checkoutTotalPrice}</td>
            </tr>
            <tr>
                <th>結帳日期:</th>
                <td>${checkout.checkoutDate}</td>
            </tr>
            <tr>
                <th>紅利點數:</th>
                <td>${checkout.bonusPoints}</td>
            </tr>
            <tr>
                <th>點數到期日:</th>
                <td>${checkout.pointsDueDate}</td>
            </tr>
        </table>
        <a href="${pageContext.request.contextPath}/checkoutDetails/listByCheckoutId?checkoutId=${checkout.checkoutId}" class="btn btn-info">查看明細</a>
        <br>
        <button id="back" class="btn btn-secondary mt-3">返回結帳列表</button>
    </main>
    <script>
    document.getElementById('back').addEventListener('click', function() {
        window.location.href = "${pageContext.request.contextPath}/checkout/list";
    });
    </script>
</body>
</html>