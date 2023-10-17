$(function () {
    let people = $(".numOfPeople").find("option:selected").val();
    $(".numOfPeople").change(function () {
        var selectedValue = $(this).val();


        $(this).find("option").removeAttr("selected");


        $(this).find('option[value="' + selectedValue + '"]').attr("selected", "selected");


        people = selectedValue;

        var reservationVul = parseInt($(".getTime").text());

        var url = "/Cart/Cart?people=" + people + "&reservationVul=" + reservationVul;
        window.location.href = url;
    });
    let mealNum = $(".orderItemedCombo").length;
    let foods;
    fetch('/Api/CartApi/', {
        method: 'GET',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json(); // 将响应解析为JSON格式
        })
        .then(data => {
            // 在这里可以访问API返回的数据（data）

            foods = data;
            let tabIndex = 1;
            let Id = 1;
            let categoryId = 1;
            let categoryIdsec = 1;
            let orderHtmlCopy;
            let secMealHtmlCopy;
            let buttomHtmlCopy;
            let buttomNextHtmlCopy;
            categoryIdArr = ["Zero", "One", "Two", "Three", "Four", "Five"]
            // 迴圈放入菜單

            for (var category of foods) {
                //菜單分類start
                if (category.id != 1 && category.id != 2 && category.id != 4 && category.id != 5) {
                    orderHtmlCopy = orderHtml;
                    buttomHtmlCopy = buttomHtml;
                    buttomNextHtmlCopy = buttomHtml;
                    let switchOrderHtmlAdd1 = `<button class="accordion-button collapsed ${categoryIdArr[categoryIdsec + 1]} orderNext singleNextbutton" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSec${categoryIdArr[categoryIdsec + 1]}" aria-expanded="true" aria-controls="collapse${categoryIdArr[categoryIdsec + 1]}">下一步
                                                                                                                                                                                        </button>`;
                    buttomNextHtmlCopy = buttomNextHtmlCopy.replace(`<button class="accordion-button collapsed orderNext" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                                                                                                                                        </button>`, switchOrderHtmlAdd1);
                    orderHtmlCopy = orderHtmlCopy.replace(`<h2 class="accordion-header"></h2>`, `<h2 class="accordion-header">${category.name}</h2>`);
                    orderHtmlCopy = orderHtmlCopy.replace(`<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionCombo">`, `<div id="collapseSec${categoryIdArr[categoryIdsec]}" class="accordion-collapse collapse" data-bs-parent="#accordionSingle">`);
                    orderHtmlCopy = orderHtmlCopy.replace(`<p>還差..份</p>`, `<p>選擇${category.name}</p>`);
                    $("#accordionSingle").append(orderHtmlCopy);
                    for (let foodKey of category.meals) {
                        console.log(foodKey)
                        secMealHtmlCopy = secMealHtml;
                        secMealHtmlCopy = secMealHtmlCopy.replace(`<img src="" alt="" class="mealImg">`, `<img src="/MyRestaurantImg/${foodKey.mealsImage}"
                        alt="" class="mealImg">`);
                        secMealHtmlCopy = secMealHtmlCopy.replace(`<div class="mealName"><p class="text-center ">111</p></div>`, `<div class="mealName"><p class="text-center ">${foodKey.name}</p></div>`);
                        secMealHtmlCopy = secMealHtmlCopy.replace(` <div class="mealPrice"><p class="text-center ">111</p></div>`, ` <div class="mealPrice"><p class="text-center ">${foodKey.price}</p></div>`);
                        $(`#collapseSec${categoryIdArr[categoryIdsec]}`).find(".accordion-body").append(secMealHtmlCopy);
                    }

                    $(`#collapseSec${categoryIdArr[categoryIdsec]}`).find(".btn-Block").append(buttomNextHtmlCopy);
                    $(`#collapseSec${categoryIdArr[categoryIdsec]}`).closest(".accordion-collapse").find(".btn-Block p").attr("style", "display:none !important;");
                    $(`#collapseSec${categoryIdArr[categoryIdsec]}`).find(".btn-Block").find(".singleNextbutton").attr("style", "background-color:#CE0000 !important;")

                    categoryIdsec++;
                    continue;
                }
                if (category.id == 5) {
                    orderHtmlCopy = orderHtml;
                    buttomHtmlCopy = buttomHtml;
                    buttomNextHtmlCopy = buttomHtml;
                    let switchOrderHtmlAdd1 = `<button class="accordion-button collapsed Three orderNext singleNextbutton" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSecThree" aria-expanded="true" aria-controls="collapse${categoryIdArr[categoryIdsec + 1]}">下一步
                                                                                                                                                                                        </button>`;
                    buttomNextHtmlCopy = buttomNextHtmlCopy.replace(`<button class="accordion-button collapsed orderNext" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                                                                                                                                        </button>`, switchOrderHtmlAdd1);
                    orderHtmlCopy = orderHtmlCopy.replace(`<h2 class="accordion-header"></h2>`, `<h2 class="accordion-header">${category.name}</h2>`);
                    orderHtmlCopy = orderHtmlCopy.replace(`<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionCombo">`, `<div id="collapseSec${categoryIdArr[categoryIdsec]}" class="accordion-collapse collapse" data-bs-parent="#accordionSingle">`);
                    orderHtmlCopy = orderHtmlCopy.replace(`<p>還差..份</p>`, `<p>選擇${category.name}</p>`);
                    $("#accordionSingle").append(orderHtmlCopy);
                    $(`#collapseSecTwo`).find(".btn-Block").append(buttomNextHtmlCopy);
                    $(`#collapseSecTwo`).find(".btn-Block p").attr("style", "display:none !important");
                    $(`#collapseSecTwo`).find(".singleNextbutton").attr("style", "background-color:#CE0000 !important;");
                    categoryIdsec++;
                }
                orderHtmlCopy = orderHtml;
                buttomHtmlCopy = buttomHtml;
                buttomNextHtmlCopy = buttomHtml;
                let switchOrderHtmlAdd1 = `<button class="accordion-button collapsed ${categoryIdArr[categoryId + 1]} orderNext setNextBtn " type="button" data-bs-toggle="collapse" data-bs-target="#collapse${categoryIdArr[categoryId + 1]}" aria-expanded="true" aria-controls="collapse${categoryIdArr[categoryId + 1]}">下一步
                                                                                                                                                                                        </button>`;
                buttomNextHtmlCopy = buttomNextHtmlCopy.replace(`<button class="accordion-button collapsed orderNext" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                                                                                                                                        </button>`, switchOrderHtmlAdd1);
                orderHtmlCopy = orderHtmlCopy.replace(`<h2 class="accordion-header"></h2>`, `<h2 class="accordion-header">${category.name}</h2>`);
                orderHtmlCopy = orderHtmlCopy.replace(`<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionCombo">`, `<div id="collapse${categoryIdArr[categoryId]}" class="accordion-collapse collapse" data-bs-parent="#accordionCombo">`);
                orderHtmlCopy = orderHtmlCopy.replace(`<p>還差..份</p>`, `<p>選擇${category.name}</p>`);
                $("#accordionCombo").append(orderHtmlCopy);
                //菜單分類end



                // 放入上一步下一步按鈕

                $(`#collapse${categoryIdArr[categoryId]}`).find(".btn-Block").append(buttomNextHtmlCopy);

                for (let foodKey of category.meals) {

                    // 创建一个新的mealHtml副本
                    let mealHtmlCopy = mealHtml;
                    // 使用jQuery找到相关元素并更新它们的内容
                    mealHtmlCopy = mealHtmlCopy.replace('<div class="meal" id="">', `<div class="meal" data-category="${category.name}" data-id="${Id}">`);
                    mealHtmlCopy = mealHtmlCopy.replace('<img src="" alt="" class="mealImg">', `<img src="/MyRestaurantImg/${foodKey.mealsImage}"
                        alt="" class="mealImg">`);
                    mealHtmlCopy = mealHtmlCopy.replace('<div class="mealName"><p class="text-center "></p></div>', `<div class="mealName"><p class="text-center ">${foodKey.name}</p></div>`);
                    mealHtmlCopy = mealHtmlCopy.replace('<div class="mealPrice"><p class="text-center "></p></div>', `<div class="mealPrice"><p class="text-center ">${foodKey.price}</p></div>`);
                    mealHtmlCopy = mealHtmlCopy.replace('<input type="radio" id="" name="" value=""/>', `<input type="radio"  id="${foodKey.id}" name="${category.name}" value="${foodKey.id}"/>`);
                    mealHtmlCopy = mealHtmlCopy.replace('<label for="name">', `<label for="${foodKey.id}">`);
                    secMealHtmlCopy = secMealHtml;
                    secMealHtmlCopy = secMealHtmlCopy.replace(`<img src="" alt="" class="mealImg">`, `<img src="/MyRestaurantImg/${foodKey.mealsImage}"
                        alt="" class="mealImg">`);
                    secMealHtmlCopy = secMealHtmlCopy.replace(`<div class="mealName"><p class="text-center ">111</p></div>`, `<div class="mealName"><p class="text-center ">${foodKey.name}</p></div>`);
                    secMealHtmlCopy = secMealHtmlCopy.replace(` <div class="mealPrice"><p class="text-center ">111</p></div>`, ` <div class="mealPrice"><p class="text-center ">${foodKey.price}</p></div>`);
                    $(`#collapse${categoryIdArr[categoryId]}`).find(".accordion-body").append(mealHtmlCopy).addClass("ff");
                    if (category.id == 5) {
                        $(`#collapseSecTwo`).find(".accordion-body").append(secMealHtmlCopy).addClass("ff");
                    }
                    Id++
                }
                categoryId++;
                tabIndex++;

            }
            $(".meal input[type='radio']").change(function () {
                let category = $(this).closest(".meal").data("category");

                $(`.meal[data-category="${category}"]`).closest(".accordion-collapse").find(".btn-Block p").attr("style", "display:none !important");
                $(`.meal[data-category="${category}"]`).closest(".accordion-collapse").find(".orderNext")
                    .attr("style", "display:inline !important;background-color:#CE0000 !important");
                $(`input[name='${category}']`).not(":checked").closest(".meal").attr("style", "opacity:0.3");
                $(`input[name='${category}']:checked`).closest(".meal").attr("style", "opacity:1");
            });
            let lastButton = 0;
            let lastArr = ["One", "Two", "Three", "Four", "Five", "Six"]
            $(".accordion-collapse").each(function () {
                buttomHtmlCopy = buttomWhiteHtml;
                buttomHtmlCopySec = buttomWhiteHtml;
                let switchOrderHtmlAdd1 = `<button class="accordion-button collapsed ${lastArr[lastButton]} white" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${lastArr[lastButton]}" aria-expanded="true" aria-controls="collapse${lastArr[lastButton]}">上一步
                                                                                                                                                                                        </button>`;
                let switchOrderHtmlAdd2 = `<button class="accordion-button collapsed ${lastArr[lastButton]} white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSec${lastArr[lastButton]}" aria-expanded="true" aria-controls="collapse${lastArr[lastButton]}">上一步
                                                                                                                                                                                        </button>`;
                buttomHtmlCopy = buttomHtmlCopy.replace(`<button class="accordion-button collapsed white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                                                                                                                                        </button>`, switchOrderHtmlAdd1);
                buttomHtmlCopySec = buttomHtmlCopySec.replace(`<button class="accordion-button collapsed white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                                                                                                                                        </button>`, switchOrderHtmlAdd2);
                $(`#collapse${lastArr[lastButton + 1]}`).find(".btn-Block").prepend(buttomHtmlCopy);
                $(`#collapseSec${lastArr[lastButton + 1]}`).find(".btn-Block").prepend(buttomHtmlCopySec);
                lastButton++;

            })
            $(".white").attr("style", "background-color:#fff !important;color:#222; !important")
            $(".form-control").focus(function () {
                // 当输入字段获得焦点时执行的代码
                $(this).css("background-color", "#dde");
                $(this).css("color", "#555");
                $("label").css("color", "#555");
            });
            let totalPrice = 0;

            $("#collapseOne").removeClass("collapsed");
            $("#collapseOne").addClass("show");
            $("#collapseSecOne").removeClass("collapsed");
            $("#collapseSecOne").addClass("show");
            let orderItemHtmlCopy;
            let newButton = $(`<button class="accordion-button collapsed orderNext setNextBtn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                                                                                                                                        加入訂單</button>`);

            // 替換元素

            $(".setNextBtn").last().replaceWith(newButton);
            var lastsingleNextbutton = $(".singleNextbutton").last();
            lastsingleNextbutton.remove();
            // 隱藏所有下一步按鈕
            $(".setNextBtn").attr("style", "display:none !important;");
            //加點的不用隱藏
            $(`singleNextbutton`)
                .attr("style", "display:inline !important;background-color:#CE0000 !important");
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            })


            // 綁定 click 事件到 newButton
            //******加入購物車功能start
            newButton.click(function () {

                const mealIds = [];
                for (let category of foods) {
                    if (category.id != 1 && category.id != 2 && category.id != 4 && category.id != 5) {
                        continue;
                    }
                    let itemId = $(`input[name='${category.name}']:checked`).val();
                    for (let meal of category.meals) {
                        if (parseInt(itemId) == parseInt(meal.id)) {
                            mealIds.push(meal.id)
                        }
                    }
                }

                // mealIds 是數字陣列
                const requestBody = {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    // 直接將 mealIds 陣列作為請求的主體
                    body: JSON.stringify(mealIds),
                };

                //叫用api更新資料庫和加入購物車
                fetch('/api/CartApi/', requestBody)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('網路錯誤');
                        }
                        return response.json()
                        // 請求成功，您可以在這裡處理響應
                    })
                    .then(data => {
                        let total = 0;
                        let cart = "";
                        let orderItemHtmlcopy = orderItemHtml;

                        let i = 1;
                        let subtotal = 0;
                        let isMainOne = false;
                        for (let item of data.cartItems) {
                            orderItemHtmlcopy = orderItemHtml;
                            let newItem = "";
                            i = 1;
                            subtotal = 0
                            isMainOne = false;
                            for (let detail of item.cartItemDetails) {

                                if (i == 1) {
                                    $("[data-category='主菜']").each(function () {

                                        var mainmealName = $(this).find(".mealName p").text();
                                        console.log(mainmealName)
                                        if (mainmealName.trim() == detail.mealName.trim()) {
                                            orderItemHtmlcopy = orderItemHtmlcopy.replace(`<div class="mainMeal">主餐</div>`, `<div class="mainMeal">${detail.mealName}<p class="ms-4">${detail.qty}</p></div>`);
                                            isMainOne = true;
                                        }
                                    })
                                    if (isMainOne == false) {
                                        orderItemHtmlcopy = orderItemHtmlcopy.replace(`<div class="mainMeal">主餐</div>`, ``);
                                        orderItemHtmlcopy = orderItemHtmlcopy.replace(`<button class="editOrderItem btn  text-end" id="">編輯</button>`, `<button class="editOrderItemIncre btn  text-end" id="${item.id}">編輯</button>`);
                                        newItem += `<li class="d-flex"><p>${detail.mealName}</p><p class="ms-4">${detail.qty}</p></li>`
                                    }
                                }
                                else {
                                    newItem += `<li class="d-flex"><p>${detail.mealName}</p><p class="ms-4">${detail.qty}</p></li>`;
                                }
                                i++;
                                subtotal += detail.mealPrice * detail.qty;
                            }

                            orderItemHtmlcopy = orderItemHtmlcopy.replace(`<ul class="orderItemedUl  "></ul>`, `<ul class="orderItemedUl">${newItem}</ul>`);
                            orderItemHtmlcopy = orderItemHtmlcopy.replace(`<div class="submitTotal">小計</div>`, `<div class="submitTotal ms-4">${subtotal}</div>`);
                            orderItemHtmlcopy = orderItemHtmlcopy.replace(`<button class="editOrderItem btn  text-end" id="">編輯</button>`, `<button class="editOrderItem btn  text-end" id="${item.id}">編輯</button>`);
                            orderItemHtmlcopy = orderItemHtmlcopy.replace(`<button class="deleteOrderItem btn  text-end" id="">刪除</button>`, `<button class="deleteOrderItem btn  text-end" id="${item.id}">刪除</button>`);
                            cart += orderItemHtmlcopy;
                            total += subtotal;


                        }
                        $(".mealSelectedContent").html(cart);
                        $(".totalPrice").text(total);
                        //重整購物車
                        $(".editOrderItem").each(function () {
                            var id = $(this).attr("id");
                            $(this).click(function () {
                                window.location.href = "/Cart/EditCartItem?cartItemId=" + id;

                            })
                        })
                        $(".deleteOrderItem").each(function () {
                            var parameterValue = $(this).attr("id");
                            var url = '/Api/CartApi/DeleteCartItem?cartItemId=' + parameterValue;
                            $(this).click(function () {
                                $.ajax({
                                    url: url,
                                    type: 'DELETE',
                                    dataType: 'json',
                                    success: function (data) {

                                        window.location.href = "#totalPrice";
                                        location.reload();
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        console.error('There was a problem with the AJAX request:', errorThrown);
                                    }
                                });

                            })//

                        })
                        $(".editOrderItemIncre").off("click");
                        $(".editOrderItemIncre").each(function () {
                            var id = $(this).attr("id");
                            $(this).click(function () {
                                window.location.href = "/Cart/EditCartSecItem?cartItemId=" + id;

                            })
                        })
                    })
                    .catch(error => {
                        console.error('發生錯誤:', error);
                    });
                mealNum++;
                if (mealNum < people) {
                    Swal.fire("點下一套餐點");


                } else {

                }
                $(":radio").prop("checked", false);
                $(".setNextBtn").attr("style", "display:none !important;");
                $(".setNextBtn").closest(".btn-Block p").attr("style", "display:inline !important");
                $(".meal").attr("style", "opacity:1");
                $("#accordionCombo").find(".btn-Block p").attr("style", "display:inline-block");


            });
            //******加入購物車功能end
            $(".mealSec").each(function () {
                var thisMealSec = $(this);
                thisMealSec.find(".decre").click(function () {
                    var num = thisMealSec.find(".num p");
                    var currentNum = parseInt(num.text());
                    if (currentNum > 1) {
                        var newNum = currentNum - 1;
                    }
                    num.text(newNum.toString());

                });
                thisMealSec.find(".incre").click(function () {
                    var num = thisMealSec.find(".num p");
                    var currentNum = parseInt(num.text());
                    var newNum = currentNum + 1;
                    num.text(newNum.toString());
                });
                thisMealSec.find(".addInCart").click(function () {
                    var mealname = thisMealSec.find(".mealName p").text();
                    var mealPrice = thisMealSec.find(".mealPrice p").text();
                    var qty = parseInt(thisMealSec.find(".num p").text());
                    var subtotal = parseInt(mealPrice) * qty;;
                    const requestBody = {
                        method: 'POST'
                    };
                    fetch('/api/CartApi/AddSecCart?mealName=' + mealname + "&qty=" + qty, requestBody)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('網路錯誤');
                            }
                            return response.json()

                        })
                        .then(data => {
                            let total = 0;
                            let itemId = 1;
                            for (let item of data.cartItems) { itemId = item.id };
                            let orderItem = $(".orderItemedSingo").find(".orderItemedSingoli").text();
                            if (orderItem.length == 0) {
                                let orderItemSecHtmlCopy = orderItemSecHtml;
                                orderItemSecHtmlCopy = orderItemSecHtmlCopy.replace(`<li class="d-flex orderItemedSingoli"><p>mealName</p><p class="ms-3 me-4">× qty</p></li>`, `<li class="d-flex orderItemedSingoli"><p class="mealname">${mealname}</p><p class="ms-3 me-4 qty">${qty}</p></li>`);

                                orderItemSecHtmlCopy = orderItemSecHtmlCopy.replace(`<div class="submitTotal text-end">subtotal</div>`, `<div class="submitTotal text-end">${subtotal}</div>`);
                                orderItemSecHtmlCopy = orderItemSecHtmlCopy.replace(`<button class="editOrderItemIncre btn  text-end" id="">編輯</button>`, `<button class="editOrderItemIncre btn  text-end" id="${itemId}">編輯</button>`);
                                orderItemSecHtmlCopy = orderItemSecHtmlCopy.replace(`<button class="deleteOrderItem btn  text-end" id="">刪除</button>`, `<button class="deleteOrderItem btn  text-end" id="${itemId}">刪除</button>`);

                                $(".mealSelectedContent").append(orderItemSecHtmlCopy);
                            }
                            else {
                                var haveOrimealname = false;
                                $(".orderItemedSingoli").each(function () {
                                    var oriqty = parseInt($(this).find(".qty").text());
                                    var oriSubtotal = parseInt($(this).closest(".orderItemedSingo").find(".submitTotal").text());
                                    if ($(this).find(".mealname").text() == mealname) {

                                        $(this).find(".qty").text((oriqty + qty).toString());
                                        haveOrimealname = true;
                                        console.log(oriSubtotal)
                                        $(this).closest(".orderItemedSingo").find(".submitTotal").text((oriSubtotal + subtotal).toString())
                                    }

                                })
                                if (haveOrimealname == false) {
                                    var lastorderItemedSingoli = $(".orderItemedSingoli").last();
                                    var oriSubtotal = lastorderItemedSingoli.closest(".orderItemedSingo").find(".submitTotal").text();
                                    lastorderItemedSingoli.after(`<li class="d-flex orderItemedSingoli"><p class="mealname">${mealname}</p><p class="ms-3 me-4 qty">${qty}</p></li>`);
                                    lastorderItemedSingoli.closest(".orderItemedSingo").find(".submitTotal").text((parseInt(oriSubtotal) + subtotal).toString())
                                }

                            }
                            $(".orderItemed").each(function () {
                                total += parseInt($(this).find(".submitTotal").text())
                            });
                            $(".totalPrice").text(total.toString());


                            //再次放入刪除事件
                            $(".deleteOrderItem").off("click");
                            $(".deleteOrderItem").each(function () {
                                var parameterValue = $(this).attr("id");
                                var url = '/Api/CartApi/DeleteCartItem?cartItemId=' + parameterValue;
                                $(this).click(function () {
                                    $.ajax({
                                        url: url,
                                        type: 'DELETE',
                                        dataType: 'json',
                                        success: function (data) {
                                            window.location.href = "#totalPrice";
                                            location.reload();


                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            console.error('There was a problem with the AJAX request:', errorThrown);
                                        }
                                    });

                                })//

                            })
                            $(".editOrderItemIncre").off("click");
                            $(".editOrderItemIncre").each(function () {
                                var id = $(this).attr("id");
                                $(this).click(function () {
                                    window.location.href = "/Cart/EditCartSecItem?cartItemId=" + id;

                                })
                            })




                            thisMealSec.find(".num p").text(1);
                        })
                        .catch(error => {
                            console.error('發生錯誤:', error);
                        });

                });
            });
        })
        .catch(error => {
            console.error('Fetch error:', error);
        });

    $(".editOrderItem").each(function () {
        var id = $(this).attr("id");
        $(this).click(function () {
            window.location.href = "/Cart/EditCartItem?cartItemId=" + id;

        })
    })

    $(".editOrderItemIncre").each(function () {
        var id = $(this).attr("id");
        $(this).click(function () {
            window.location.href = "/Cart/EditCartSecItem?cartItemId=" + id;

        })
    })
    $(".deleteOrderItem").each(function () {
        var parameterValue = $(this).attr("id");
        var url = '/Api/CartApi/DeleteCartItem?cartItemId=' + parameterValue;
        $(this).click(function () {
            $.ajax({
                url: url,
                type: 'DELETE',
                dataType: 'json',
                success: function (data) {
                    window.location.href = "#totalPrice";
                    location.reload();
                }
            });


        })

    })
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    })
    $(".finishOrder").click(function () {
        var phoneNumber = $("#floatingInputPhone").val().toString();
        var reservationVul = parseInt($(".getTime").text());


        if (people <= 0) {
            Swal.fire("請選擇人數");
        } else if (mealNum < people) {
            Swal.fire("請選擇符合人數的套餐");
        } else if (isNaN(reservationVul) && !Number.isInteger(reservationVul)) {
            Swal.fire("請選擇時間");
        } else if (mealNum > people) {
            console.log(mealNum)

            swalWithBootstrapButtons.fire({
                title: '套餐數超過人數了，您確定要點單嗎？',
                text: '您可能會吃不下！',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '是的我要',
                cancelButtonText: '不，請取消',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {

                    $.ajax({
                        url: '/Api/OrderApi?phoneNumber=' + phoneNumber + '&people=' + people + '&reserv=' + reservationVul,
                        type: 'POST',
                        success: function () {
                            Swal.fire("訂單已建立").then((result) => { window.location.href = "/Cart/ConfirmCheckout"; }

                            )
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            // 請求失敗
                            Swal.fire('該時段預約訂位已滿請重新選擇');
                        }
                    })


                } 
            });

        } else {
            $.ajax({
                url: '/Api/OrderApi?phoneNumber=' + phoneNumber + "&people=" + people + "&reserv=" + reservationVul,
                type: 'POST',
                success: function () {
                    Swal.fire("訂單已建立").then((result) => { window.location.href = "/Cart/ConfirmCheckout"; }

                    )


                },
                error: function (xhr, textStatus, errorThrown) {
                    // 请求失败
                    if (xhr.status === 400) {
                        Swal.fire("該時段預約訂位已滿請重新選擇");
                    } else {
                        console.log("其他错误:", textStatus, errorThrown);
                    }
                }
            });

        }
    });
    //選擇時間框的事件start
    //
    $(".btnSelectRes").click(function () {
        $(".blockSelectRes").css("display", "flex");
    })
    //改變選擇的radio樣式
    $(".rdo").change(function () {
        if ($(this).is(":checked")) {
            $(this).next(".btnRadio").css("background", "linear-gradient(#e99e61, #6B4423)");
            $(this).next(".btnRadio").css("border-bottom", "5px solid #6B4423");
            $(this).next(".btnRadio").css("color", "#fff");
        } else {
            $(this).next(".btnRadio").css("background", "linear-gradient(#fff, #eee)");
            $(this).next(".btnRadio").css("border-bottom", "5px solid #ddd");
            $(this).next(".btnRadio").css("color", "");
        }

        // 还原其他 radio 按钮的样式
        $(".rdo").not(this).each(function () {
            if (!$(this).prop("disabled")) {
                $(this).next(".btnRadio").css("background", "linear-gradient(#fff, #eee)");
                $(this).next(".btnRadio").css("border-bottom", "5px solid #ddd");
                $(this).next(".btnRadio").css("color", "");
            }
        });


    });
    //保存按鈕按下事件
    $(".timeSave").click(function () {
        var timevalue = $("input[name='time']:checked").val();
        window.location.href = "/Cart/Cart?people=" + people + "&reservationVul=" + timevalue;
        $(".blockSelectRes").css("display", "none")
    })
    if (people <= 2) {
        cantResArr = [];
        $(".cantRes2").each(function () {
            cantResArr.push(parseInt($(this).text()));
        })
    }
    else {
        cantResArr = [];
        $(".cantRes4").each(function () {
            cantResArr.push(parseInt($(this).text()));
        })
    }

    for (var num of cantResArr) {


        var labelElement = $(`label[for='day${num}']`);
        labelElement.css("background", "linear-gradient(#333, #000)");
        labelElement.css("color", "#000");
        labelElement.css("border-bottom", "5px solid #000");
        labelElement.addClass("full");
        $(`#day${num}`).prop("disabled", true);

    }





});


let buttomHtml = `<button class="accordion-button collapsed orderNext" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                                                                                                                                        </button>`;
let buttomWhiteHtml = `<button class="accordion-button collapsed white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                                                                                                                                        </button>`;

let orderHtml = `                <div class="accordion-item">
<div class="accordion-title">
<h2 class="accordion-header"></h2>
</div>
<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionCombo">
                                             <p class="text-white ms-3">請選擇餐點</p>
                                             <div class="accordion-body d-flex">
                                             </div>
                                             <div class="btn-Block">
                                             <p>還差..份</p>
                                             </div>
                                             </div>
                                             </div>`;
let mealHtml = `
<label for="name"><div class="meal" id="">
<img src="" alt="" class="mealImg">
<div class="mealName"><p class="text-center "></p></div>
<div class="mealPrice"><p class="text-center "></p></div><input type="radio" id="" name="" value=""/>
</div></label>`;
let secMealHtml = `<div class="mealSec" data-category="">
        <img src="" alt="" class="mealImg">
        <div class="mealName"><p class="text-center ">111</p></div>
        <div class="mealPrice"><p class="text-center ">111</p></div>
        <ul class="qtyUse">
            <li>
                <button class="decre">-</button>
            </li>
            <li class="num">
                <p>1</p>
            </li>
            <li>
                <button class="incre">+</button>
            </li>
        </ul>
        <button class="addInCart">
            加入訂單
        </button>
    </div>`;

let orderItemHtml = `<div class="orderItemed orderItemedCombo mb-2 d-flex justify-content-between">
<div class="d-flex">
<div class="mainMeal">主餐</div>
<ul class="orderItemedUl  "></ul>
<div class="submitTotal">小計</div>
</div>
    <div class="d-flex justify-content-end col-12">
        <button class="editOrderItem btn  text-end" id="">編輯</button>
        <button class="deleteOrderItem btn  text-end" id="">刪除</button>
    </div>
</div>
`;
let orderItemSecHtml = `<div class="orderItemed orderItemedSingo mb-2 d-flex justify-content-between">
                                    <div class="d-flex col-12">
                                        <ul class="orderItemedUl  ">
                                            <li class="text-white">加點</li>
                                            <li class="d-flex orderItemedSingoli"><p>mealName</p><p class="ms-3 me-4">× qty</p></li>
                                        </ul>

                                        <div class="submitTotal text-end">subtotal</div>
                                    </div>
                                    <div class="d-flex justify-content-end col-12">
                                        <button class="editOrderItemIncre btn  text-end" id="">編輯</button>
                                        <button class="deleteOrderItem btn  text-end" id="">刪除</button>
                                    </div>
                                </div>`

