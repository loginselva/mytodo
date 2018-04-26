<!DOCTYPE html>
<html>
	<head>
		<title>My ToDo List</title>
		<meta name="google-signin-scope" content="profile email">
		<meta name="google-signin-client_id" content="784354227250-lg8q5didqc1ok2115sda26aml72r4utu.apps.googleusercontent.com"/>
		<script type="text/javascript" src="assets/javascript/jquery.min.js"></script>
		<script src="https://apis.google.com/js/platform.js" async defer></script>
    <link href="assets/css/style.css" type="text/css" rel="stylesheet" />		
	</head>
	<body>
		<div class="signDiv">
			<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
		</div>
		<div class="container" style='display:none;' >
			<div class="container_header">
        <span class="container_title">Welcomes your, Yours ToDo List..</span>
				<a href="javascript:void(0);" onclick="signOut();" class="signout" >Sign out</a>
			</div>
			<div class="todo_container">
				  <div class="todo_text" style="padding 10px;">
            <input type="text" name="todo" id="text_cls" class="text_cls" maxlength="60" placeholder="What's in your mind?">
          </div>

          <div class="list_cls" >
            <ul class="li_style"
            </ul>
          </div>
           <span id="item_cnt">0</span> Items Left
          <div class='clone_li' style="display:none;">
                <li> 
                  <input type="checkbox" name="check_list" class='cls_check' value='1' > 
                  <span class="list_text"></span> 
                  <a href="javascript:void(0);" class="delete_list" data-list_id=''> <img class="delete_cls" src="assets/image/delete_icon.png" /></a>
                </li>
          </div>

			</div>
		</div>
	</body>
<script type="text/javascript" src="assets/javascript/custom.js"></script> 
</html>