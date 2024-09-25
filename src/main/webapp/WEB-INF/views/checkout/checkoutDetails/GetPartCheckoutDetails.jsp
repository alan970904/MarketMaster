<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>部分結帳明細</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/CSS/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/extra.css">

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <style>
		.dataTables_length select { padding-right: 30px !important; background-position: right 0.5rem center !important; }
	</style>
</head>
<body>
    <%@ include file="../../body/body.jsp"%>
    <main>
    <div >
        <h1>部分結帳明細</h1>
        <table border="1" id="checkoutDetailsTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>結帳編號</th>
                    <th>產品編號</th>
                    <th>數量</th>
                    <th>產品價格</th>
                    <th>結帳小計</th>
                    <th>操作</th>
                </tr>
            </thead>
             <tbody>
                <c:forEach var="detail" items="${checkoutDetailsList}">
                    <tr>
                        <td>${detail.checkoutId}</td>
                        <td>${detail.productId}</td>
                        <td>
                            <input type="number" name="numberOfCheckout" value="${detail.numberOfCheckout}" min="1" class="form-control quantity-input" data-product-id="${detail.productId}" data-product-price="${detail.productPrice}">
                        </td>
                        <td>${detail.productPrice}</td>
                        <td>
                            <input type="text" value="${detail.numberOfCheckout * detail.productPrice}" readonly class="form-control-plaintext subtotal">
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/checkout/checkoutDetails/details?checkoutId=${detail.checkoutId}&productId=${detail.productId}" class="btn btn-info btn-sm">詳情</a>
                            <button class="btn btn-primary btn-sm update-btn" data-checkout-id="${detail.checkoutId}" data-product-id="${detail.productId}">修改</button>
                            <button class="btn btn-danger btn-sm delete-btn" data-checkout-id="${detail.checkoutId}" data-product-id="${detail.productId}">刪除</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="mt-3">
            <h4>總計: <span id="totalAmount">0</span></h4>
            <h4>紅利點數: <span id="bonusPoints">0</span></h4>
        </div>
        <div class="mt-3">
            <a href="${pageContext.request.contextPath}/checkout/checkoutMain" class="btn btn-secondary">返回主頁</a>
            <a href="${pageContext.request.contextPath}/checkout/checkoutDetails/list" class="btn btn-info">所有結帳紀錄</a>
        </div>
    </div>
    </main>
    <script>
    $(document).ready(function() {
        var table = $('#checkoutDetailsTable').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Chinese-traditional.json"
            }
        });

        // 計算總金額和更新紅利點數
        function updateTotalAndBonus() {
            var total = 0;
            $('.subtotal').each(function() {
                total += parseFloat($(this).val());
            });
            $('#totalAmount').text(total.toFixed(0));
            
            // 假設每100元可得1點紅利
            var bonusPoints = Math.floor(total / 100);
            $('#bonusPoints').text(bonusPoints);

            // 更新資料庫中的總金額和紅利點數
            $.ajax({
            	url: '${pageContext.request.contextPath}/checkout/updateTotalAndBonus',
                type: 'POST',
                data: {
                    checkoutId: '${param.checkoutId}',
                    totalAmount: total,
                    bonusPoints: bonusPoints
                },
                success: function(response) {
                    console.log('總金額和紅利點數已更新');
                }
            });
        }

        // 數量變更時更新小計和總計
        $('.quantity-input').on('change', function() {
            var quantity = $(this).val();
            var price = $(this).data('product-price');
            var subtotal = quantity * price;
            $(this).closest('tr').find('.subtotal').val(subtotal.toFixed(0));
            updateTotalAndBonus();
        });

        // 修改按鈕點擊事件
          $('.update-btn').on('click', function() {
        var row = $(this).closest('tr');
        var checkoutId = $(this).data('checkout-id');
        var productId = $(this).data('product-id');
        var quantity = row.find('.quantity-input').val();
        var productPrice = row.find('.quantity-input').data('product-price');
        var checkoutPrice = Math.round(quantity * productPrice); // 使用 Math.round() 進行四捨五入

        $.ajax({
        	url: '${pageContext.request.contextPath}/checkout/checkoutDetails/update',
            type: 'POST',
            data: {
                checkoutId: checkoutId,
                productId: productId,
                numberOfCheckout: quantity,
                productPrice: productPrice,
                checkoutPrice: checkoutPrice
            },
            success: function(response) {
                if (response.status === 'success') {
                    alert('更新成功');
                    row.find('.subtotal').val(checkoutPrice.toFixed(0));
                    updateTotalAndBonus();
                } else {
                    alert('更新失敗: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert('更新失敗: ' + error);
            }
        });
    });

        // 刪除按鈕點擊事件
        $('.delete-btn').on('click', function() {
            if (confirm('確定要刪除嗎？')) {
                var checkoutId = $(this).data('checkout-id');
                var productId = $(this).data('product-id');
                var row = $(this).closest('tr');
                $.ajax({
                	url: '${pageContext.request.contextPath}/checkout/checkoutDetails/delete',
                    type: 'POST',
                    data: {
                        checkoutId: checkoutId,
                        productId: productId
                    },
                    success: function(response) {
                        table.row(row).remove().draw();
                        updateTotalAndBonus();
                        alert('刪除成功');
                    }
                });
            }
        });

        

        // 頁面加載時計算初始總金額和紅利點數
        updateTotalAndBonus();
        });
    </script>
</body>
</html>