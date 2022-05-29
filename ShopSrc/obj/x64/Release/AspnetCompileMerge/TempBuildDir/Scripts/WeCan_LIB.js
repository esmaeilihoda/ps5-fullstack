//wecan
function WAError(r) {
    alert(r);
};
function gregorian_to_jalali(gy, gm, gd) {
    g_d_m = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    if (gy > 1600) {
        jy = 979;
        gy -= 1600;
    } else {
        jy = 0;
        gy -= 621;
    }
    gy2 = (gm > 2) ? (gy + 1) : gy;
    days = (365 * gy) + (parseInt((gy2 + 3) / 4)) - (parseInt((gy2 + 99) / 100)) + (parseInt((gy2 + 399) / 400)) - 80 + gd + g_d_m[gm - 1];
    jy += 33 * (parseInt(days / 12053));
    days %= 12053;
    jy += 4 * (parseInt(days / 1461));
    days %= 1461;
    if (days > 365) {
        jy += parseInt((days - 1) / 365);
        days = (days - 1) % 365;
    }
    jm = (days < 186) ? 1 + parseInt(days / 31) : 7 + parseInt((days - 186) / 30);
    jd = 1 + ((days < 186) ? (days % 31) : ((days - 186) % 30));
    return [jy, jm, jd];
}


function jalali_to_gregorian(jy, jm, jd) {
    if (jy > 979) {
        gy = 1600;
        jy -= 979;
    } else {
        gy = 621;
    }
    days = (365 * jy) + ((parseInt(jy / 33)) * 8) + (parseInt(((jy % 33) + 3) / 4)) + 78 + jd + ((jm < 7) ? (jm - 1) * 31 : ((jm - 7) * 30) + 186);
    gy += 400 * (parseInt(days / 146097));
    days %= 146097;
    if (days > 36524) {
        gy += 100 * (parseInt(--days / 36524));
        days %= 36524;
        if (days >= 365) days++;
    }
    gy += 4 * (parseInt(days / 1461));
    days %= 1461;
    if (days > 365) {
        gy += parseInt((days - 1) / 365);
        days = (days - 1) % 365;
    }
    gd = days + 1;
    sal_a = [0, 31, ((gy % 4 == 0 && gy % 100 != 0) || (gy % 400 == 0)) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    for (gm = 0; gm < 13; gm++) {
        v = sal_a[gm];
        if (gd <= v) break;
        gd -= v;
    }
    return [gy, gm, gd];
}

function HtmlSelectBind(listobject, Sid, valueequaltotex) {
    HtmlSelectRemoveAll(Sid);
    var vselect = fin(Sid);
    var conn = listobject;
    for (var i = 0; i < conn.length; i++) {
        var option = document.createElement("option");
        if (valueequaltotex)
            option.text = conn[i][0]["Value"];
        else
            option.text = conn[i][0]["Key"];
        option.value = conn[i][0]["Value"];
        vselect.add(option);
    }
}


function AddDate(tt, days) {

    var date = new Date(tt);
    var newdate = new Date(date);
    newdate.setDate(newdate.getDate() + parseInt(days));
    var dd = newdate.getDate();
    var mm = newdate.getMonth() + 1;
    var y = newdate.getFullYear();
    var someFormattedDate = y + '/' + mm + '/' + dd;
    return someFormattedDate;
}


function HtmlSelectRemoveAll(id) {
    var len = fin(id).length;
    var selo = fin(id);
    var dff = new Array(len);
    for (var i = 0; i < len; i++) {
        dff[i] = selo.options[i].value;
    }
    for (var tt = 0; tt < dff.length; tt++) {
        fin(id).value = dff[tt];
        selo.remove(selo.selectedIndex);
    }
}
function GetType(obj) {
    var rt = "";
        if (obj.nodeName == "INPUT") {
            if (obj.type == "text") {
                rt = "text";
            }
           else if (obj.type == "checkbox") {
                rt = "checkbox";
            }
          else  if (obj.type == "radio") {
                rt = "radio";
            }
            else
                rt = "text";
        }
        if (obj.nodeName == "SELECT") {
            rt = "select";
        }
    return rt;
}

function FillForm(listobject) {
    var conn = listobject[0];
    var rt = "";
    for (var i = 0; i < conn.length; i++) {
        if(!fin(conn[i]["Key"])) {
            alert("Not Found " + conn[i]["Key"] + " In This Episode:0x505");
        }
        else {
            var tty =  GetType(fin(conn[i]["Key"]));
            if (tty == "text")
                fin(conn[i]["Key"]).value = conn[i]["Value"];
            else if (tty == "checkbox") {
                if (conn[i]["Value"] == "True")
                    fin(conn[i]["Key"]).checked = true;
                else
                    fin(conn[i]["Key"]).checked = false;
            }
            else if (tty == "radio")
                fin(conn[i]["Key"]).selected = conn[i]["Value"];
            else if (tty == "select")
                fin(conn[i]["Key"]).value = conn[i]["Value"];
        }
    }
}

function titler(titler) {
    var title = titler;
    var tlen = title.length;
    var tls = 0;
    setInterval(
    function titler() {
        document.getElementsByTagName("title")[0].innerText += title.substr(tls, 1);
        tls++;
        if (tls > tlen) {
            tls = 0;
            document.getElementsByTagName("title")[0].innerText = "*";
        }
    }, 300);
}
function bec(sender, arg) {
    var u = 1;
}
var urlparms;
(window.onpopstate = function () {
    var match,
        pl = /\+/g,
        search = /([^&=]+)=?([^&]*)/g,
        decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
        query = window.location.search.substring(1);
    urlparms = {};
    while (match = search.exec(query))
        urlparms[decode(match[1])] = decode(match[2]);
})();
function Dblval(number) {
    var number = "" + number + "";
    var numlen = number.length;
    var rtnum = "";
    for (var i = 0; i < numlen; i++) {
        if (number.substr(i, 1) == "0" || number.substr(i, 1) == "1" || number.substr(i, 1) == "2" || number.substr(i, 1) == "3"
            || number.substr(i, 1) == "4" || number.substr(i, 1) == "5" || number.substr(i, 1) == "6"
            || number.substr(i, 1) == "7" || number.substr(i, 1) == "8" || number.substr(i, 1) == "9"
            || number.substr(i, 1) == ".") {
            var test = number.substr(i, 1);
            rtnum = rtnum + test;
        }
    }
    if (rtnum.length == 0)
        rtnum = "0";
    return rtnum;
}
function Intval(number) {
    var number = "" + number + "";
    var numlen = number.length;
    var rtnum = "";
    for (var i = 0; i < numlen; i++) {
        if (number.substr(i, 1) == "0" || number.substr(i, 1) == "1" || number.substr(i, 1) == "2" || number.substr(i, 1) == "3"
            || number.substr(i, 1) == "4" || number.substr(i, 1) == "5" || number.substr(i, 1) == "6"
            || number.substr(i, 1) == "7" || number.substr(i, 1) == "8" || number.substr(i, 1) == "9"
            ) {
            var test = number.substr(i, 1);
            rtnum = rtnum + test;
        }
    }
    return rtnum;
}
function numsep(thiss, sep) {
    if (thiss.value != "") {
        var num = thiss.value;
        //num = num.replace(/,/ , '');
        num = Dblval(num);
        var name = thiss.name;
        var sep = sep;
        var number = typeof num === "number" ? num.toString() : num;
        var seprator = typeof sep === "undefined" ? ',' : sep;
        var seped = number.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1" + seprator);
        thiss.value = seped;
    }
}
function numseprt(val, sep) {
    var num = val;
    //num = num.replace(/,/ , '');
    num = Dblval(num);
    // var name = thiss.name;
    var sep = sep;
    var number = typeof num === "number" ? num.toString() : num;
    var seprator = typeof sep === "undefined" ? ',' : sep;
    var seped = number.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1" + seprator);
    return seped;
}
function FSrow(gridid) {
    var grid = $find(gridid);
    var masterTable = grid.get_masterTableView();
    var row = masterTable.get_dataItems();
    var serow;
    for (var i = 0; i < row.length; i++) {
        if (row[i]._selected) {
            serow = row[i];
            break;
        }
    }
    return serow;
}
function opengrid(gridid,cellnum) {
    var grid = $find(gridid);
    var masterTable = grid.get_masterTableView();
    var newItem = masterTable.get_dataItems()[0].get_element();
    masterTable.selectItem(newItem);
    var row = masterTable.get_dataItems();
    row[0]._element.cells[cellnum].click();
}
function closegrid(gridid, newcellclick) {
    var grid = $find(gridid);
    var batc = grid.get_batchEditingManager();
    var masterTable = grid.get_masterTableView();
    batc.addNewRecord(masterTable);
    var newItem = masterTable.get_dataItems()[0].get_element();
    masterTable.selectItem(newItem);
    var row = masterTable.get_dataItems();
    row[0]._element.cells[newcellclick].click();
}//._deleteRecord
function gridrowdelete(gridid) {
    var view = $find(gridid).get_masterTableView();
    view.set_dataSource([""]);
    //view.fireCommand("InitInsert", "");
    view.dataBind();
}


function fin(id) {
    var rt = document.getElementById(id);
    if (rt)
        return rt;
    else (rt == null)
    //alert("Not Found This Element (" + id + " ) ");
}
function fin1(id) {
    var rt = document.getElementById(id);
    if (rt)
        return rt;
    else (rt == null)
    alert("Not Found This Element (" + id + " ) ");
}

function javalist(listobject, fieldname) {
    var conn = listobject;
    var rt = "";
    for (var i = 0; i < conn.length; i++) {
        if (conn[i]["Key"] == fieldname) {
            rt = conn[i]["Value"];
            break;
        }
    }
    return rt;
}



////////////////////////////////////////////////wecacn clock
//var canvas = document.getElementById("canvas");
//var ctx = canvas.getContext("2d");
//var radius = canvas.height / 2;
//ctx.translate(radius, radius);
//radius = radius * 0.90
//setInterval(drawClock, 1000);

//function drawClock() {
//    drawFace(ctx, radius);
//    drawNumbers(ctx, radius);
//    drawTime(ctx, radius);
//}

//function drawFace(ctx, radius) {
//    var grad;
//    ctx.beginPath();
//    ctx.arc(0, 0, radius, 0, 2 * Math.PI);
//    ctx.fillStyle = 'gold';
//    ctx.fill();
//    grad = ctx.createRadialGradient(0, 0, radius * 0.95, 0, 0, radius * 1.05);
//    grad.addColorStop(0, 'brown');
//    grad.addColorStop(0.5, 'orange');
//    grad.addColorStop(1, '#333');
//    ctx.strokeStyle = grad;
//    ctx.lineWidth = radius * 0.1;
//    ctx.stroke();
//    ctx.beginPath();
//    ctx.arc(0, 0, radius * 0.77, 0, 2 * Math.PI);
//    ctx.fillStyle = 'orange';
//    ctx.fill();
//}

//function drawNumbers(ctx, radius) {
//    var ang;
//    var num;
//    ctx.font = radius * 0.15 + "px B Yekan";
//    ctx.textBaseline = "middle";
//    ctx.textAlign = "center";
//    for (num = 1; num < 13; num++) {
//        ang = num * Math.PI / 6;
//        ctx.rotate(ang);
//        ctx.translate(0, -radius * 0.85);
//        ctx.rotate(-ang);
//        ctx.fillText(num.toString(), 0, 0);
//        ctx.rotate(ang);
//        ctx.translate(0, radius * 0.85);
//        ctx.rotate(-ang);
//    }
//}

//function drawTime(ctx, radius) {
//    var now = new Date();
//    var hour = now.getHours();
//    var minute = now.getMinutes();
//    var second = now.getSeconds();

//    //hour
//    hour = hour % 12;
//    hour = (hour * Math.PI / 6) +
//    (minute * Math.PI / (6 * 60)) +
//    (second * Math.PI / (360 * 60));
//    drawHand(ctx, hour, radius * 0.5, radius * 0.07);
//    //minute
//    minute = (minute * Math.PI / 30) + (second * Math.PI / (30 * 60));
//    drawHand(ctx, minute, radius * 0.8, radius * 0.07);
//    // second
//    second = (second * Math.PI / 30);
//    drawHand(ctx, second, radius * 0.9, radius * 0.02);
//}

//function drawHand(ctx, pos, length, width) {
//    ctx.beginPath();
//    ctx.lineWidth = width;
//    ctx.lineCap = "round";
//    ctx.moveTo(0, 0);
//    ctx.rotate(pos);
//    ctx.lineTo(0, -length);
//    ctx.stroke();
//    ctx.rotate(-pos);
//}
//////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function SetGridCellVal(gridid, CellUniaName, CellValue) {
    var grid = $find(gridid);
    var batchEditingManager = grid.get_batchEditingManager();
    var rt = FSrow(gridid).get_cell(CellUniaName);
    batchEditingManager.changeCellValue(rt, CellValue);
}
function GetValRad(gridid, CellUniaName) {
    var grid = $find(gridid);
    var batchEditingManager = grid.get_batchEditingManager();
    var rt = FSrow(gridid).get_cell(CellUniaName);
        //.get_cell(CellUniaName);
    var value = batchEditingManager.getCellValue(rt, CellUniaName);
    return value;
}
///////////////
function getradgvalreadon(gridid,uniqname) {
    var row = FSrow(gridid);
    return row.get_cell(uniqname).innerText.trim();
}
function getradgval(gridid, uniqname) {
    var row = FSrow(gridid);
    return row.get_cell(uniqname).getElementsByTagName("div")[0].innerText;
}
////////////////////////////////////////////////////////////////////////
function selectopen(sender, args) {
    var masterTable = sender.get_masterTableView();
    var newItem = masterTable.get_dataItems()[args._row.sectionRowIndex].get_element();
    masterTable.selectItem(newItem);
    //alert(args._row.sectionRowIndex);
}
function addRecordGrid(gridid, newcellclick,e) {
    var evtobj = window.event ? event : e
    if (evtobj.keyCode == 9 && evtobj.shiftKey)
        var dum = 0;
    else
        if (e.keyCode == 9 || e.keyCode == 13) {
            var grid = $find(gridid);
            var masterTable = grid.get_masterTableView();
            var batchManager = grid.get_batchEditingManager();
            //var newItem = masterTable.get_dataItems()[0].get_element();
            var row = masterTable.get_dataItems();

            /////////////////////////////////////////////////////////
            for (var i = 1; i < row.length; i++) {
                if (row[i]._selected) {
                    masterTable.selectItem(row[i - 1].get_element());
                    row[i - 1]._element.cells[newcellclick].click();
                    setrownum();
                    return;
                    break;
                }

            }
            var seindex = masterTable.get_selectedItems()[0].get_element().rowIndex;
            var rowlen = masterTable.get_dataItems().length;
            //masterTable.selectItem(masterTable.get_dataItems().get_element()[seindex + 1]);
            if (seindex == 1) {
                //newItem.set_selected = true;
                batchManager.addNewRecord(masterTable);
                var newItem = masterTable.get_dataItems()[0].get_element();
                masterTable.selectItem(newItem);
                var row = masterTable.get_dataItems();
                row[0]._element.cells[newcellclick].click();
            }
            //batchManager.openRowForEdit(1);
            setrownum(gridid,"Row");
        }
}
function setrownum(gridid, RowCellUniqName) {
    var grid = $find(gridid);
    var masterTable = grid.get_masterTableView();
    var batchEditingManager = grid.get_batchEditingManager();
    var row = masterTable.get_dataItems();
    var serow;
    var len = row.length + 1;
    for (var i = 0; i < row.length; i++) {
        len = len - 1;
        row[i].get_cell(RowCellUniqName).innerText = len;
    }
}
function gridelementcount(val, gridid, UniqName) {
    var grid = $find(gridid);
    var masterTable = grid.get_masterTableView();
    var row = masterTable.get_dataItems();
    var serow;
    var rlen = new Array(2);
    var len = 0;
    var i = 0
    for (i ; i < row.length; i++) {
        if (row[i].get_cell(UniqName).getElementsByTagName("div")[0].innerText == val)
            len = len + 1;
        if (len > 1)
            break;
    }
    rlen[0] = i;
    rlen[1] = len;
    return rlen;
}
function delet(uniqnams, gridid) {
    var row = FSrow(gridid);
    for (var i = 0; i < uniqnams.length; i++) {
        if (row.get_cell(uniqnams[i]))
            SetGridCellVal(gridid, uniqnams[i], "");
    }
}
function TComboSeV(id) {
    var invcmbvalue = "";
    var InvCombo = $find(id);
    if (InvCombo._selectedItem != null)
        invcmbvalue = InvCombo.get_selectedItem()._control._value;
    else
        invcmbvalue = "";
    return invcmbvalue;
}
function tmaskedvalue(id) {
    var maskInput = $find(id);
    var Reqtext = maskInput._projectedValue;
    return Reqtext;
}
//////////////////////////////////////////////////////////////////////
function SetAutoParm(id, Code, Url, saveurl, notsave) {
    var sss = true;
    if (notsave)
        sss = false;
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("' + id + '").value ="" ');
    var UUrl = "InvRemittance.aspx/getdeliver";
    if (Url)
        UUrl = Url;

    $(function () {
        $("[id$="+id+"]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "', 'code': '" + Code + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                document.getElementById(id).value == i.item.val;
                document.getElementById(id).click();
            },
            change: function (e, i) {
                var tets = fin(id).value;
                var tsd = tets.length;
                tets = tsd - tets.replace('\\', '').length;
                if (tets == 0 && i.item == null) {
                    //setTimeout(
                    //    function se() {
                    if (sss) {
                        var conf = confirm("پارامتر مورد نطر یافت نشد برای ایجاد آن مطمئن هستید؟؟؟؟");
                        if (conf == true) {
                            document.getElementById(id).value = saveparms(document.getElementById(id).value, Code, saveurl);
                            document.getElementById(id).click();
                        }
                        else {
                            document.getElementById(id).value = "";
                            document.getElementById(id).click();
                            return false
                        }
                    }
                    //    }
                    //, 100);
                }

                //goodsch(goodsid);
            },
            minLength: 0
        });
    });
}
///////////////////////////////////////////////////////////////////////
function saveparms(Dsc, Code, Url) {
    var jdata;
    var U;
    var dd;
    var UUrl = "InvRemittance.aspx/WParmsave";
    if (Url)
        UUrl = Url;
    jdata = '{ "Dsc": "' + Dsc + '","Code": "' + Code + '"}';
    U = UUrl;
    if (Dsc != "" && Dsc != " " && Dsc != "  " && Dsc.length > 1 && Dsc != "خالی")
        $.ajax({
            async: false,
            type: "POST",
            url: U,
            data: jdata,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function OnSuccess(data) {
                dd = data.d;
            }
            //failure: function (data) {
            //    alert("uuuuuuuu");

            //},
            //Erroror: function (data) {
            //    alert("uuuuuuuuuuu");
            //}
        });
    else
        dd = "خالی";
    return dd;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////
function AutoComCos(id, Url) {
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: Url,
                    data: "{ 'Name': '" + request.term + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                document.getElementById(id).value == i.item.val;
                document.getElementById(id).click();
            },
            change: function (e, i) {
                    //    }
                    //, 100);

                //goodsch(goodsid);
            },
            minLength: 0
        });
    });
}
///
//////////////////////////////////////////////////////////////////////////////////////////////////////
function SetAutoCom(id, codeid, Url, Ndata) {
    if(codeid)
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("' + codeid + '").value ="" ');
    var acc = "0";

    var UUrl = "WebMetod/WebMetod.aspx/GetAccCoding";
    if (Url)
        UUrl = Url;
    if (Ndata)
        acc = Ndata;

    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "', 'Ndata': '" + acc + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                if(codeid)
                document.getElementById(codeid).value = i.item.val;
            },

            minLength: 0
        });
    });
}
///
function PopupCenter(c, e, g, a) {
    var b = (screen.width / 2) - (g / 2);
    var f = (screen.height / 2) - (a / 2);
    var d = window.open(c, e, "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, copyhistory=no, width=" + g + ", height=" + a + ", top=" + f + ", left=" + b);
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Ajax_Wecan(Data, Url) {
    var jdata;
    var U;
    var dd;

    jdata = Data;
    U = Url;

    $.ajax({
        async: false,
        type: "POST",
        url: U,
        data: jdata,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function OnSuccess(data) {
            dd = data.d;
        }
        //failure: function (data) {
        //    alert("uuuuuuuu");

        //},
        //Erroror: function (data) {
        //    alert("uuuuuuuuuuu");
        //}
    });

    return dd;
}
function bslashseprat(val) {
    var i;
    var tr;
    for (i = 0; i < val.length; i++)
    {
        if (val.substr(i, 1) == "\\") {
            tr = "true";
            break;
        }
    }
    if (tr == "true")
        var rt = val.substr(0, i);
    else
        rt = val;
    return rt;
}
function bslashsepstring(val) {
    var i;
    var tr;
    for (i = 0; i < val.length; i++) {
        if (val.substr(i, 1) == "\\") {
            tr = "true";
            break;
        }
    }
    if (tr == "true")
        var rt = val.substr(i, length);
    else
        rt = val;
    return rt;
}
//////////////////////////////////////////////////////////////////////
function SetAutoCoding(id, codeid, Url, accco)
{
    
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("'+codeid+'").value ="" ');
    var acc = "0";
    
    var UUrl = "WebMetod/WebMetod.aspx/GetAccCoding";
    if (Url)
        UUrl = Url;
    if (accco)
        acc = accco;
    
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "', 'acc': '" + acc + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i)
            {
                
                document.getElementById(codeid).value = i.item.val;
            },
            
            minLength: 0
        });
    });
}











function SetAutoCodingNew(id, codeid, Url, accco)
{
    
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("'+codeid+'").value ="" ');
    var acc = "0";
    var UUrl = "WebMetod/WebMetod.aspx/GetAccCoding";
    if (Url)
        UUrl = Url;
    if (accco)
        acc = accco;
    
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "', 'acc': '" + acc + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i)
            {
                
                document.getElementById(codeid).value = i.item.val;
                
            },
            change: function (e, i) {
                if (i.item == null) {
                    //setTimeout(
                    //    function se() {
                    //    }
                    //, 100);
                }

                //goodsch(goodsid);
            },
            minLength: 0
        });
    });
}
//////////////////////////////////////////////////////////////////////
function SetAutoCenter(id, codeid, Url) {
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) {fin("' + codeid + '").value =""; fin("Customer").value="";} ');
    var acc = "0";
    var UUrl = "WebMetod/WebMetod.aspx/GetCenter";
    if (Url)
        UUrl = Url;
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                document.getElementById(codeid).value = i.item.val;
            },
            change: function (e, i) {
                if (i.item == null) {
                    //setTimeout(
                    //    function se() {
                    //    }
                    //, 100);
                }

                //goodsch(goodsid);
            },
            minLength: 0
        });
    });
}
//////////////////////////////////////////////////////////////////////
function SetAutoCodingNotEnd(id, codeid, Url, accco) {
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("' + codeid + '").value ="" ');
    var acc = "0";
    if (accco)
        acc = accco;
    var UUrl = "WebMetod/WebMetod.aspx/GetAccCodingNotEnd";
    if (Url)
        UUrl = Url;
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "', 'acc': '" + acc + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                document.getElementById(codeid).value = i.item.val;
            },
            change: function (e, i) {
                if (i.item == null) {
                    //setTimeout(
                    //    function se() {
                    //    }
                    //, 100);
                }

                //goodsch(goodsid);
            },
            minLength: 0
        });
    });
}
///////////////////////////////////////////////////////////////////////
function txtclear(id, e) {
    var keyCode = e.keyCode;
    var evtobj = window.event ? event : e
    if(evtobj.keyCode == 8)
    fin(id).value = "";
}
///////
function AjaxSession(){
    var rt = Ajax_Wecan('', "WebMetod/WebMetod.aspx/SessionAjax");
    return rt;
}
function controldate(date, Url) {
    var UUrl = "WebMetod/WebMetod.aspx/ControlDate";
    if (Url)
        UUrl = Url;
    var rt = Ajax_Wecan("{'date':'" + date + "'}", UUrl);
    

    return rt;
}
////////
function GetGoodslvl1Com(id, codeid, Url) {
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("' + codeid + '").value ="" ');
    var UUrl = "WebMetod/WebMetod.aspx/GetGoodslvl1";
    if (Url)
        UUrl = Url;
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                document.getElementById(codeid).value = i.item.val;
            },
            minLength: 0
        });
    });
}
////////
function GetGoodslvl2Com(id, codeid, Url) {
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("' + codeid + '").value ="" ');
    var UUrl = "WebMetod/WebMetod.aspx/GetGoodslvl2";
    if (Url)
        UUrl = Url;
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                document.getElementById(codeid).value = i.item.val;
            },
            minLength: 0
        });
    });
}
////////
function GetGoodslvl3Com(id, codeid, Url) {
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("' + codeid + '").value ="" ');
    var UUrl = "WebMetod/WebMetod.aspx/GetGoodslvl3";
    if (Url)
        UUrl = Url;
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                document.getElementById(codeid).value = i.item.val;
            },
            minLength: 0
        });
    });
}
////////
function GetGoodsAutoCom(id, codeid, Url) {
    fin(id).setAttribute("onkeydown", 'if (event.keyCode==8) fin("' + codeid + '").value ="" ');
    var UUrl = "WebMetod/WebMetod.aspx/GetGoodsId";
    if (Url)
        UUrl = Url;
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({
                    
                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            select: function (e, i) {
                document.getElementById(codeid).value = i.item.val;
            },
            minLength: 0
        });
    });
}
/////////
function GetAccountingAutoCom_SP(id, codeid, Url) {
    var UUrl = "WebMetod/WebMetod.aspx/GetGoodsId";
    var row = FSrow();
    fin(id).setAttribute("onkeydown", 'var row = FSrow();if (event.keyCode==8) row.get_cell("' + codeid + '").getElementsByTagName("div")[0].innerText ="";');
    if (Url)
        UUrl = Url;
    $(function () {
        $("[id$=" + id + "]").autocomplete({
            source: function (request, response) {
                $.ajax({

                    url: UUrl,
                    data: "{ 'Name': '" + request.term + "', 'acc': '0'}",
                    dataType: "json",

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('@@@@@')[0],
                                val: item.split('@@@@@')[1],
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                row.get_cell(codeid).getElementsByTagName("div")[0].innerText = i.item.val;
                row._element.cells["3"].click();
            }
            ,
            minLength: 0
        });
    });
}

function GetSetting()
{
    
        var ret;
        var jdata = '{}';
       
        
            $.ajax({
                async: false,
                type: "POST",
                url: "/Dummypage.aspx/GetSetting",
                data: jdata,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function OnSuccess(data) {
                    ret = data.d;
                }
                //failure: function (data) {
                //    alert("uuuuuuuu");

                //},
                //Erroror: function (data) {
                //    alert("uuuuuuuuuuu");
                //}
            });
        
            return ret;
    }




   
    
        
        


///////////////
function notify(title, mes, timehide) {

    var option = {
        body: mes,
        icon: '../../../images/logobot.gif',
        width: '500px',
        height :'500px',
    }

    var notify = new Notification(title, option);
    //alert(notify.title);

    setTimeout(function () { notify.close() }, timehide);

    notify.onshow = function () {
        console.log('Notification showing...');
    };

    notify.onclose = function () {
        console.log('Notification closed!');
    };

    notify.onerror = function () {
        console.log('Notification error!');
    };

    notify.onclick = function () {
        console.log('Notification Click!');
    };

}
function alt() {
    alert("hello");
}
function showNotification(title, mes, timehide) {

    if (!("Notification" in window)) {

        console.error('Your browser does not support Notification');
        alert('مرورگر شما از ناتفیکیشن پشتیبانی نمیکند!!!');

    } else if (Notification.permission === "granted") {

        notify(title, mes, timehide);

    } else if (Notification.permission !== "denied") {

        Notification.requestPermission(function (permission) {

            if (permission === "granted") {

                notify(title, mes, timehide);

            }

        });

    }

}
//------------------------------------convert to arabic 
setInterval(function () {
    var classnames = document.getElementsByClassName("rfText");
    for (var oo = 0; oo < classnames.length; oo++) {
        //alert(classnames[oo].name);
        classnames[oo].setAttribute('id', 'ft' + oo);
        //classnames[oo].addEventListener('blur', testss(classnames[oo].id), false);
        var id = classnames[oo].id;
        document.getElementById(id).value = document.getElementById(id).value.replace('ی', 'ي');
    }
}, 1000);
//------------------------------------convert to arabic rgFilterBox
setInterval(function () {
    var classnames = document.getElementsByClassName("rgFilterBox");
    for (var oo = 0; oo < classnames.length; oo++) {
        //alert(classnames[oo].name);
       // classnames[oo].setAttribute('id', 'ft' + oo);
        //classnames[oo].addEventListener('blur', testss(classnames[oo].id), false);
        //var id = classnames[oo].id;
        classnames[oo].value = classnames[oo].value.replace('ی', 'ي');
    }
}, 700);

function testss(id) {
    document.getElementById(id).value = document.getElementById(id).value.replace('ی', 'ي');
}
///////////////////////////////////////////date seprator
function dateseprator(val, e) {
    var v = val;
    if (v.match(/^\d{4}$/) !== null) {
        fin(e).value = v + '/';
    }
    else if (v.match(/^\d{4}\/\d{2}$/) !== null) {
        fin(e).value = v + '/';
    }
}
//css show popup
function linshowpopup(popid) {
    var popup = document.getElementById(popid);
    popup.classList.toggle("show");
}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^______________________________rcbInput radPreventDecorate
//setInterval(function () {
//    var classnames = document.getElementsByClassName("rgFilterBox");
//    for (var oo = 0; oo < classnames.length; oo++) {
//        //alert(classnames[oo].name);
//        classnames[oo].setAttribute('id', 'ft' + oo);
//        //classnames[oo].addEventListener('blur', testss(classnames[oo].id), false);
//        var id = classnames[oo].id;
//        document.getElementById(id).value = document.getElementById(id).value.replace('ی', 'ي');
//    }
//}, 1000);
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^_______________________________________________
function rebonshow(fn, hostname) {
    fin("formrebon").innerHTML = "";
    var del = "del"; var set = "set";
    var data = "{'sRet':'" + fn + "', 'Mode':'get'}";
    var url = "http://" + hostname + "/WebMetods.aspx/getformrebon";
    var rt = Ajax_Wecan(data, url);
    for (var i = 0; i < rt.length; i++) {
        fin("formrebon").innerHTML += "<span class='rebonspan' ><img id='del" + i + "' src='http://" + hostname + "/images/1359301717_exit.png' class='rebondi' />" +
            "<a id='sp" + i + "' style='color:white'>" + javalist(rt[i], "ElName") + "</a></span>";
        fin("sp" + i).setAttribute("onclick", "showp('');if(fin('rebonframe').src !='" + javalist(rt[i], "ElAddress") + "') fin('rebonframe').setAttribute('src','" + javalist(rt[i], "ElAddress") + "');");
        fin("del" + i).setAttribute("onclick", "rebonsave('del', '" + javalist(rt[i], "ElName") + "', '" + javalist(rt[i], "ElAddress") + "');return false;");
    }
    fin("formrebon").innerHTML += "<div class='reboninp'><img id='setreb' src='http://" + hostname + "/images/plus.png' class='rebonpl' />"
    + "<input type='text' id='fname' placeholder='نام' class='reboninput' /><input placeholder='آدرس' type='text' id='faddress' class='reboninput' /></div>";
    fin("setreb").setAttribute("onclick", "rebonsave('set')");
}
function rebonsave(mode, fnn, hnn) {
    var fn = fin("fn").value; var data;
    var hostname = fin("hostname").value;
    if (mode == "del") {
        data = "{'sRet':'" + fn + "', 'Mode':'" + mode + "', 'fname':'" + fnn + "', 'faddress':'" + hnn + "' }";
    }
    else
     data = "{'sRet':'" + fn + "', 'Mode':'"+mode+"', 'fname':'" + fin("fname").value + "', 'faddress':'" + fin("faddress").value + "' }";
    var url = "http://" + hostname + "/WebMetods.aspx/setformrebon";
    Ajax_Wecan(data, url);
    rebonshow(fn, hostname);
}