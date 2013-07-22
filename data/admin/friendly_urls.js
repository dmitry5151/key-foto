/*
Friendly URLs
by http://shopcms-moduli.com/
*/

function hfu_translit(s, whitespace){
  if('undefined' == typeof(whitespace)) whitespace = '-';
  var a=new Array('�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�',' ','\'',',')
  var b=new Array('a','b','v','g','d','e','yo','zh','z','y','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ts','ch','sh','sch','','','e','yu','ya','yi','i','ye','-','','')
  var x=s.toLowerCase()
  for(i=0;i<a.length;i++){
	  y=eval('/'+a[i]+'/g');
	  x=x.replace(y,b[i]);
  }
  x = x.replace(/[^a-zA-Z0-9\-]/g, whitespace);
  x = x.replace(/\-+/g, whitespace);
  x = x.replace(/[^\w]+$/g, '');

  return x;
}

// Auto-Transliterator form OnSubmit
function fu_transliterator_submit() {

  if(document.forms.url_transliterator.setCatSlugs.checked || document.forms.url_transliterator.setPagesSlugs.checked || document.forms.url_transliterator.setNewsSlugs.checked) {

    if(document.forms.url_transliterator.rewriteExistingSlugs.checked)
      return confirm('�� �������, ��� ������ ���������������� ������, ������� ���� ���������� ������? ��� ����� �������� � ��������� � ����������� ���������� ���������.') ? true : false;

  } else {
    alert('��������, ��� ����� �������� ������ ������������ ������ (������� �������)');
    return false;
  }

}

// Translit text inputs
function hfu_translit_inputs(sourceInputName, targetInputName, whitespace) {
  if('undefined' == typeof(whitespace)) whitespace = '-';
  var sourceText = $('[name='+sourceInputName+']').attr('value')
  $('[name='+targetInputName+']').attr('value', hfu_translit(sourceText, whitespace));
}

