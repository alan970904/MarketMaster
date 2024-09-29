<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>結帳明細詳情</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/CSS/style.css" rel="stylesheet">
    <link rel="stylesheet" href="/ispan/CSS/extra.css">

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
</head>
<body>
    <%@ include file="../../body/body.jsp"%>
    <main class="container mt-5">
        <h1 class="mb-4">結帳明細詳情</h1>
        <div class="card">
            <div class="card-body">
                <table class="table table-bordered">
                    <tr>
                        <th>結帳編號</th>
                        <td>${checkoutDetails.checkoutId}</td>
                    </tr>
                    <tr>
                        <th>產品編號</th>
                        <td>${checkoutDetails.productId}</td>
                    </tr>
                    <tr>
                        <th>數量</th>
                        <td>${checkoutDetails.numberOfCheckout}</td>
                    </tr>
                    <tr>
                        <th>產品價格</th>
                        <td>${checkoutDetails.productPrice}</td>
                    </tr>
                    <tr>
                        <th>結帳總價</th>
                        <td>${checkoutDetails.checkoutPrice}</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="mt-3">
            <button id="back" class="btn btn-secondary">返回</button>
        </div>
    </main>
    <script>
    $(document).ready(function() {
        $('#back').click(function() {
            window.history.back();
        });
    });
    </script>
</body>
</html>