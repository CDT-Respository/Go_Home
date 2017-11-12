/**
 * Created by SChen on 2017/11/8.
 */

function selectbycity(){
    var sheng=$("#province option:checked").val();
    var shi=$("#city option:checked").val();
    var qu=$("#district option:checked").val();
    var param="mysheng="+sheng+"&myshi="+shi+"&myqu="+qu;
    alert(param);
}

/*分页按钮*/



