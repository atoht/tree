<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Made with Thimble</title>
<link rel="stylesheet" type="text/css"
	href="sou/easyui/themes/default/easyui.css">

<script type="text/javascript" src="sou/easyui/jquery.min.js"></script>
<script type="text/javascript" src="sou/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<h2>CheckBox Tree</h2>
	<p>Tree nodes with check boxes.</p>

	<div style="margin: 20px 0;">
		<a href="#" class="easyui-linkbutton" onclick="getChecked()">GetChecked</a>
	</div>
	<div>
		<input type="button" value="a" onclick="$('#dlg').dialog('open')">
	</div>
	
	
	<p>Click below button to open or close dialog.</p>
	
	<div id="dlg" style="width:300px;height:350px;padding:10px" >
	<p>title</p>
		<div id="b" style="padding: 5px">
		<ul id="tt" class="easyui-tree"
			data-options="url:'sou/easyui/demo/tree/tree_data1.json',checkbox:true"></ul>
	</div>
	
	</div>
	
	<script type="text/javascript">
	  $(function() {
		  $('#dlg').dialog( {
				  modal : true,
				  closable:false,
				  border:false,
				  noheader:true,
				  closed: true,
				  buttons : [{
					  text : 'OK',
					  handler : function(){
						  getChecked();
						  $('#dlg').dialog('close');
					  }
				  },{
					  text : 'claer',
					  handler : function(){
						  $('#dlg').dialog('close');
					  }
				  }]
		  });
	  $('#tt').tree({ onSelect: function(node){
			  
			  if($("#tt").tree('getSelected').state=='open'){
	                $(this).tree('collapse',node.target);  
	            }else{
	                $(this).tree('expand',node.target);  
	            }
			  var isLeaf = $("#tt").tree('isLeaf', node.target);  
		        if (isLeaf) {  
					if (node.checked) {
						$('#tt').tree('uncheck', node.target);
			 
					} else {
						$('#tt').tree('check', node.target);
			 
					}
		        }
		  }
	  });
		  
	  }); 
      function getChecked(){        
        var nodes = $('#tt').tree('getChecked');
        var s = '';
        for(var i=0; i<nodes.length; i++){
          if (s != '') s += ',';
          s += nodes[i].text;
        }
        alert(s);
      }

      
    </script>
</body>
</html>
