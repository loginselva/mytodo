  function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        var url_data = {
          action:'loggedin',
          ID:profile.getId(),
          full_name:profile.getName(),
          email:profile.getEmail(),
          token_id:googleUser.getAuthResponse().id_token
        }
        //console.log(url_data.full_name); return false;
        $.ajax({
          type:'post',
          url:'includes/sample_controller.php',
          data:url_data,
          success:function(data){
            console.log(data);
          }
        });
        isAlive();
        getCurrentlist();
        window.location.reload();
    }
    function onFailure(error) {
      console.log(error);
    }

  function renderButton() {
    gapi.signin2.render('my-signin2', {
      'scope': 'profile email',
      'width': 240,
      'height': 50,
      'longtitle': true,
      'theme': 'dark',
      'onsuccess': onSignIn,
      'onfailure': onFailure
    });
  }

function isAlive(){
  $.ajax({
          type:'post',
          url:'includes/sample_controller.php',
          data:{action:'isAlive'},
          success:function(data){
            console.log(data);
            if(data !='loggedout'){
              $('.signDiv').hide();
              $('.signout,.container').show();
              //var obj = $.parseJSON(data);
             // $('#welcome_name').val(obj['username']);
            }else{
              $('.signDiv').show();
              $('.signout,.container').hide();
            }
          }
        });
} 
isAlive();

function signOut() {
  var auth2 = gapi.auth2.getAuthInstance();
  auth2.signOut().then(function () {
      console.log('User signed out.');
       $.ajax({
          type:'post',
          url:'includes/sample_controller.php',
          data:{action:'loggedout'},
          success:function(data){
            console.log(data);
          }
        });
       isAlive();
       window.location.reload();
  });
}
  
  $(document).ready(function(){

    $('#text_cls').bind('change focus blur keyup keypress', function(event) { 
      $(this).val($(this).val().replace(/[^A-Za-z0-9_-\s]/, ''));
  });
   
  $('#text_cls').bind('keyup', function(e) {  
    var me = $(this);
    if(e.keyCode==13 && me.val().trim().length != 0 ){ 
        $.ajax({
          type:'post',
          url:'includes/sample_controller.php',
          data:{action:'add',val:me.val().trim()},
          success:function(data){
            me.val('');
            getCurrentlist();
          }
        });
    }
  });

 
$('body').on('click', 'div.list_cls ul.li_style li a.delete_list', function(){ 
  var me = $(this);
  var list_id = me.attr('data-list_id');
      $.ajax({
        type:'post',
        url:'includes/sample_controller.php',
        data:{action:'removeList',list_id:list_id},
        success:function(data){
          //console.log(data);
          me.parent().remove();
          getCurrentlist();
        }
      });
});

$('body').on('click', 'div.list_cls ul.li_style li .cls_check', function(){ 
  var me = $(this);
  var status = "";
  //console.log($(this).is(':checked'));
  if($(this).is(':checked')){ 
    status = 'A';
    me.next().css("text-decoration","line-through"); 
    me.parent().css("background-color","#D3D3D3"); 
    $('#item_cnt').html( (parseInt( $('#item_cnt').html() ) - 1) );
  }else{ 
    status = 'I'; 
    me.next().css("text-decoration","none");
    me.parent().css("background-color","");
    $('#item_cnt').html( (parseInt( $('#item_cnt').html() ) + 1) );
  }
  var list_id = me.attr('data-list_id');
      $.ajax({
        type:'post',
        url:'includes/sample_controller.php',
        data:{action:'checkeditem',list_id:list_id,status:status},
        success:function(data){
          console.log(data);
          //me.parent().remove();
        }
      });
});

 getCurrentlist();

  
  });


    function getCurrentlist(){ 
      $('div.list_cls ul.li_style').html('');
      var cnt = 0;
        $.ajax({
          type:'post',
          url:'includes/sample_controller.php',
          data:{action:'getlist'},
          success:function(data){
            if(data != false){
              var obj = $.parseJSON(data);
              //console.log(data);
              
              $.each(obj,function(key,value){
                var clone = $('.clone_li').html();
                $('div.list_cls ul.li_style').append(clone);
                
                if(value.action == 'A'){
                  $('ul.li_style li:last-child .cls_check').attr('checked',true);
                  $('ul.li_style li:last-child .list_text').css("text-decoration","line-through");
                  $('ul.li_style li:last-child').css("background-color","#D3D3D3");                  
                }else{
                  $('ul.li_style li:last-child .cls_check').attr('checked',false);
                  $('ul.li_style li:last-child').css("background-color","");
                  cnt++;
                }
                 $('ul.li_style li:last-child .cls_check').attr('data-list_id',value.id);
                 $('ul.li_style li:last-child .list_text').html(value.list_name);
                 $('ul.li_style li:last-child .delete_list').attr('data-list_id',value.id); 
                //console.log($('ul.li_style li:last-child .cls_check').attr('class'));
              });
              $('#item_cnt').html(cnt);
            }
          }
        }); 
      
    }