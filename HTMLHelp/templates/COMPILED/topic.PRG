LOCAL CRLF
CRLF = CHR(13) + CHR(10)
_out = []

 lcSeeAlsoTopics = oHelp.InsertSeeAlsoTopics() 
Response.Write([]+ CRLF +;
   [<html>]+ CRLF +;
   [<head>]+ CRLF +;
   [<topictype value="])

Response.Write(TRANSFORM( EVALUATE([ TRIM(oHelp.oTopic.Type) ]) ))

Response.Write(["/>]+ CRLF +;
   [<title>])

Response.Write(TRANSFORM( EVALUATE([ TRIM(oHelp.oTopic.Topic) ]) ))

Response.Write([</title>]+ CRLF +;
   [<LINK rel="stylesheet" type="text/css" href="templates/wwhelp.css">]+ CRLF +;
   [<SCRIPT SRC="templates/wwhelp.js"></SCRIPT>]+ CRLF +;
   [</head>]+ CRLF +;
   [<body leftmargin=0 topmargin=0>]+ CRLF +;
   []+ CRLF +;
   [<table border=0 width="100%" bgcolor="lightblue" class="banner" cellspacing="3">]+ CRLF +;
   [<tr><td valign="center">])

 if !EMPTY(oHelp.oTopic.SeeAlso) 
Response.Write([]+ CRLF +;
   [	<span id="more" style="cursor:hand;" onclick="SeeAlsoButton();">]+ CRLF +;
   [		 <img src="bmp/seealso.gif" border=0  alt="Related Topics" ] + ;
 [style="Font:cursor:Hand">]+ CRLF +;
   [	</span>]+ CRLF +;
   [	<div id="SeeAlsoTopics" class="hotlinkbox" style="display:none" ] + ;
 [onmouseleave="SeeAlsoButton();">]+ CRLF +;
   [	<b>See also</b><br>]+ CRLF +;
   [	<span style="margin-left:10px;margin-top:15px">])

Response.Write(TRANSFORM( EVALUATE([ lcSeeAlsoTopics ]) ))

Response.Write([</span>]+ CRLF +;
   [	</div>])

 endif 
Response.Write([]+ CRLF +;
   [<span class="projectname">])

Response.Write(TRANSFORM( EVALUATE([ oHelp.cProjectname ]) ))

Response.Write([</span>]+ CRLF +;
   [</td></tr><tr><td>]+ CRLF +;
   [<span class="topicname">])

Response.Write(TRANSFORM( EVALUATE([ oHelp.FormatHtml(TRIM(oHelp.oTopic.Topic)) ]) ))

Response.Write([]+ CRLF +;
   [</span>]+ CRLF +;
   [</td></tr>]+ CRLF +;
   [</table>]+ CRLF +;
   []+ CRLF +;
   [<div class="contentpane">]+ CRLF +;
   [<br>])

Response.Write(TRANSFORM( EVALUATE([ oHelp.FormatHTML(oHelp.oTopic.Body) ]) ))

Response.Write([]+ CRLF +;
   [<br>]+ CRLF +;
   [])

 IF !EMPTY(oHelp.oTopic.Remarks) 
Response.Write([]+ CRLF +;
   [<br>]+ CRLF +;
   [<h3 class="outdent">Remarks</h3>]+ CRLF +;
   [])

Response.Write(TRANSFORM( EVALUATE([ oHelp.FormatHTML(oHelp.oTopic.Remarks) ]) ))


 ENDIF 

 IF !EMPTY(oHelp.oTopic.Example) 
Response.Write([]+ CRLF +;
   [<br>]+ CRLF +;
   [<h3 class="Outdent">Example</h3>]+ CRLF +;
   [<pre>])

Response.Write(TRANSFORM( EVALUATE([ oHelp.FormatHTML(oHelp.oTopic.Example)]) ))

Response.Write([</pre>])

 ENDIF 

 if !EMPTY(oHelp.oTopic.SeeAlso) 
Response.Write([]+ CRLF +;
   [<br>]+ CRLF +;
   [<h3 class="outdent">See also</h3>])

Response.Write(TRANSFORM( EVALUATE([ lcSeeAlsoTopics ]) ))


  endif 
Response.Write([]+ CRLF +;
   [<p>]+ CRLF +;
   [</div>]+ CRLF +;
   [<hr>]+ CRLF +;
   [<small>Last Updated: <i>])

Response.Write(TRANSFORM( EVALUATE([ TTOD(oHelp.oTopic.Updated) ]) ))

Response.Write([</i></small>]+ CRLF +;
   [</body>]+ CRLF +;
   [</html>])
