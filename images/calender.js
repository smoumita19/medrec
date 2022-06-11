function fnCalendar(e) 
{
    var temp;
    //var presentvalue=e.parentElement.children(0).value;
	var presentvalue="";
    /*
    if(chkdate(e.parentElement.children(0))==true)
    {
      presentvalue=e.parentElement.children(0).value;
    }
    else
    {
      presentvalue="";
    } 
    */
     //temp = window.showModalDialog("images/ComCalendar.html",presentvalue,"dialogHeight:14; dialogWidth:19;  center:yes;toolbar: false;status: 0;scroll:0;unadorned:0;help:no");
     temp = window.open("images/ComCalendar.html",presentvalue,"dialogHeight:14; dialogWidth:19;  center:yes;toolbar: false;status: 0;scroll:0;unadorned:0;help:no");

     if(temp!=null)
     {
       e.parentElement.children(0).value =temp;
     }
    

}
function fnEnableCalLookup(e)
{
 e.src = "images/CalEn.gif";
}
function fnDisableCalLookup(e)
{
 e.src = "images/CalDis.gif";
}