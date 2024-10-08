<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>超市訂單系統</title>
    
    <!-- 保留原有的 CSS 引用 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/CSS/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/extra.css">
    
    <!-- 修改的自定義樣式 -->
    <style>
	main{
		.card {
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
            background-color: #fff;
        }
        .card-header {
            background-color: #4e73df;
            color: white;
            font-weight: 500;
            border-bottom: none;
        }
        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
        }
        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2e59d9;
        }
        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }
        .input-group-text {
            background-color: #4e73df;
            color: white;
            border-color: #4e73df;
        }
	}
        
    </style>
</head>
<body>
     <%@ include file="../../body/body.jsp"%>
    <main class="container mt-5">
        <h1 class="mb-4">超市訂單系統</h1>
        
        <div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-list-alt me-2"></i>所有結帳記錄
                    </div>
                    <div class="card-body">
                        <a href="${pageContext.request.contextPath}/checkout/list" class="btn btn-primary w-100">
                            <i class="fas fa-search me-2"></i>查看所有結帳記錄
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-search me-2"></i>搜尋結帳記錄
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/checkout/search" method="get">
                            <div class="input-group">
                                <input type="text" class="form-control" name="customerTel" placeholder="輸入客戶電話">
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-plus-circle me-2"></i>新增結帳記錄
                    </div>
                    <div class="card-body">
                        <a href="${pageContext.request.contextPath}/checkout/add" class="btn btn-primary w-100">
                            <i class="fas fa-plus me-2"></i>新增結帳記錄
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- 保留原有的 JS 引用 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>