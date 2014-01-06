{literal}<style>
.status_New {
  color: red;
  font-weight: bold;
  text-transform: uppercase;
  text-align: center;
  vertical-align: middle;
  }
.unknown {
  color: red;
  }
</style>{/literal}

<h3>Status: {$status_message}</h3>

{* This page is generated by CRM/Banking/Page/Payments.php *}

<div>
{if $show=='payments'}
  <a class="button" href="{$url_show_statements}">
    <span><div class="icon details-icon"></div>{ts}Show Statements{/ts}</span>
  </a>
{else}
  <a class="button" href="{$url_show_payments}">
    <span><div class="icon details-icon"></div>{ts}Show Payments{/ts}</span>
  </a>
{/if}

<a class="button" href="{$url_show_payments_new}">
  <span style="{$button_style_new}"><div class="icon inform-icon"></div>{ts}New{/ts}</span>
</a>
<a class="button" href="{$url_show_payments_analysed}">
  <span style="{$button_style_analysed}"><div class="icon inform-icon"></div>{ts}Analysed{/ts}</span>
</a>
<a class="button" href="{$url_show_payments_completed}">
  <span style="{$button_style_completed}"><div class="icon inform-icon"></div>{ts}Completed{/ts}</span>
</a>
<!--a class="button" href="#">
  <span style="{$button_style_custom}"><div class="icon edit-icon"></div>{ts}Custom Filter{/ts}</span>
</a-->
</div>
<br/><br/>

{if not $rows}    {* NO ROWS FOUND *}
  {if $show=='payments'}    
    <div id="help" class="description">
      {ts}No payments could be found with the requested status. Try the other status filter buttons above to find your imported payments.{/ts}
    </div>
  {else}
    <div id="help" class="description">
      {ts}No statments could be found with the requested status. Try the other status filter buttons above to find your imported statements.{/ts}
    </div>
  {/if}
{else}            {* ROWS FOUND -> CREATE TABLE *}

<table id="contact-activity-selector-dashlet">
{if $show=='payments'}
<thead>
	<tr>
		<th colspan="1" rowspan="1" class="ui-state-default">
			<div class="DataTables_sort_wrapper"><span class="DataTables_sort_icon"></span></div>
		</th>
		<th colspan="1" rowspan="1" class="crm-banking-payment_date ui-state-default">
			<div class="DataTables_sort_wrapper">{ts}Date{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
		</th>
		<th colspan="1" rowspan="1" class="crm-banking-payment_target_owner ui-state-default">
			<div class="DataTables_sort_wrapper">{ts}Account{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
		</th>
		<th colspan="1" rowspan="1" class="crm-banking-payment_target_owner ui-state-default">
			<div class="DataTables_sort_wrapper">#<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
		</th>
		<th colspan="1" rowspan="1" class="crm-banking-payment_amount ui-state-default">
			<div class="DataTables_sort_wrapper">{ts}Amount{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
		</th>
		<th colspan="1" rowspan="1" class="crm-banking-payment_source_account nosort ui-state-default">
			<div class="DataTables_sort_wrapper">{ts}Party{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
		</th>
		<th colspan="1" rowspan="1" class="ccrm-banking-payment_state ui-state-default">
			<div class="DataTables_sort_wrapper">{ts}Status{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
		</th>
    <th colspan="1" rowspan="1" class="ui-state-default">
      <div class="DataTables_sort_wrapper"><span></span></div>
    </th>
		<th colspan="1" rowspan="1" class="hiddenElement ui-state-default">
			<div class="DataTables_sort_wrapper">&nbsp;<span class="DataTables_sort_icon"></span></div>
		</th>
	</tr>
</thead>
<tbody>
  {foreach from=$rows item=field key=fieldName}
  <tr class="odd ">
    <td><input id="check_{$field.id}" type="checkbox" name="payment_selected"></td>
    <td class="">{$field.date|date_format:"%d-%m-%Y"}</td>
    <td class="">{$field.account_owner}</td>
    <td class="" style="text-align: center;">{$field.sequence}</td>
    <td class="" style="text-align: right;">{$field.amount} {$field.currency}</td>
    <td class="">
      {if $field.party_contact}
        <a href="{$base_url}/civicrm/contact/view?reset=1&cid={$field.party_contact.id}">{$field.party_contact.display_name}</a>
      {else}
        <span class="unknown">{$field.party}</span>
      {/if}
      {if $field.payment_data_parsed.purpose}
        <br/>
        <span style="color: #ccc;">{$field.payment_data_parsed.purpose}</span>  
      {/if}
    </td>
    <td class="status_{$field.state}">
      {$field.state}
    </td>
    <td class=""><a href="{$field.url_link}">{ts}view{/ts}</a></td>
    <td class="hiddenElement">status-overdue</td>
  </tr>
  {/foreach}
</tbody>

{else} {* STATEMENTS *}
<thead>
  <tr>
    <th colspan="1" rowspan="1" class="ui-state-default">
      <div class="DataTables_sort_wrapper"><span class="DataTables_sort_icon"></span></div>
    </th>
    <th colspan="1" rowspan="1" class="crm-banking-payment_date ui-state-default">
      <div class="DataTables_sort_wrapper">{ts}Date{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
    </th>
    <th colspan="1" rowspan="1" class="ccrm-banking-payment_target_account nosort ui-state-default">
      <div class="DataTables_sort_wrapper">{ts}Target Account{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
    </th>
    <th colspan="1" rowspan="1" class="crm-banking-payment_date ui-state-default">
      <div class="DataTables_sort_wrapper">{ts}Statement{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
    </th>
    <th colspan="1" rowspan="1" class="crm-banking-payment_amount ui-state-default">
      <div class="DataTables_sort_wrapper">{ts}Payment count{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
    </th>
    <th colspan="1" rowspan="1" class="crm-banking-payment_source_account nosort ui-state-default">
      <div class="DataTables_sort_wrapper">{ts}Analysed{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
    </th>
    <th colspan="1" rowspan="1" class="crm-banking-payment_source_account nosort ui-state-default">
      <div class="DataTables_sort_wrapper">{ts}Completed{/ts}<!--span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span--></div>
    </th>
    <th colspan="1" rowspan="1" class="hiddenElement ui-state-default">
      <div class="DataTables_sort_wrapper">&nbsp;<!--span class="DataTables_sort_icon"></span--></div>
    </th>
  </tr>
</thead>
<tbody>
  {foreach from=$rows item=field key=fieldName}
  <tr class="odd status-overdue">
    <td><input id="check_{$field.id}" type="checkbox" name="payment_selected"></td>
    <td class="crm-contact-activity-activity_type">{$field.date|date_format:"%d-%m-%Y"}</td>
    <td class="crm-contact-activity-source_contact">{$field.target}</td>
    <td class="crm-contact-activity-activity_date">{$field.reference}</td>
    <td class="crm-contact-activity-source_contact">{$field.count}</td>
    <td class="crm-contact-activity-source_contact">{$field.analysed}</td>
    <td class="crm-contact-activity-source_contact">{$field.completed}</td>
    <td class="crm-contact-activity_subject">{$field.state}</td>
    <td class="hiddenElement">status-overdue</td>
  </tr>
  {/foreach}
</tbody>
{/if}
</table>
{/if}            {* ROWS FOUND -> CREATE TABLE *}

<input onClick="selectAll(true)" class="form-submit" type="submit" value="{ts}Select all{/ts}" width="200"></input>
<input onClick="selectAll(false)" class="form-submit" type="submit" value="{ts}Select none{/ts}" width="200"></input>	
<p>{ts}With selected items perform:{/ts}<br/>
<a class="button" onClick="callWithSelected('{$url_review_selected_payments}')" ><span>{ts}Review{/ts}</span></a>
<a class="button" onClick="callWithSelected('{$url_process_selected_payments}')"><span>{ts}Process{/ts}</span></a>
<a class="button" onClick="callWithSelected('{$url_export_selected_payments}')"><span>{ts}Export{/ts}</span></a>
<a class="button" onClick="callWithSelected('{$url_delete_selected_payments}')"><span>{ts}Delete{/ts}</span></a>
</p>



<!-- Required JavaScript functions -->
{literal}
<script language="JavaScript">

function selectAll(value) {
  checkboxes = document.getElementsByName('payment_selected');
  for(var i=0, n=checkboxes.length; i<n; i++) {
    checkboxes[i].checked = value;
  }
}

function getSelected() {
  checkboxes = document.getElementsByName('payment_selected');
  var selected = "";
  for(var i=0, n=checkboxes.length; i<n; i++) {
    if (checkboxes[i].checked) {
      id = checkboxes[i].id;
      if (selected.length) selected += ",";
      selected += checkboxes[i].id.substring(6)
      //selected.push(checkboxes[i].id.substring(6));
    }
  }
  return selected;
}

function callWithSelected(url) {
  location.href = url.replace("__selected__",getSelected());
}

</script>
{/literal} 

