<head>
  <meta charset="UTF-8">
</head>

<table border=0>
<tr>
	<td width="80%" align="center">
<font size=12>СЧЕТ-ФАКТУРА № {{ doc_pref }}{{ doc_number }}{{ doc_ind }} от {{ doc_date }}<br />
ИСПРАВЛЕНИЕ № <u> --- </u> от <u>   -------   </u></font><br />
за оказанные услуги электросвязи за период: {{ start_date }} - {{ end_date }}</td>
<td align="right" width="20%">
<font size="7">	
Приложение №1<br />
к постановлению Правительства<br />
Российской Федерации<br />
от 26.12.2011 г. № 1137</font>
</td></tr>
</table>
<br />
Продавец: {{ oper_name }}<br />
Адрес: {{ oper_addr }}<br />
ИНН/КПП продавца: {{ inn }} / {{ kpp }} <br />
Грузоотправитель и его адрес: ----<br />
Грузополучатель и его адрес: ----<br />
К платежно-расчетному документу № ______ от ______ <br />
Покупатель: {{ account_name }}<br />
Адрес: {{ account_addr }}<br />
ИНН/КПП покупателя: {{ account_inn }} / {{ account_kpp }} <br />
Валюта: наименование, код <u>Российский рубль, 643</u><br />
<font size="9">Дополнительные (условия оплаты по договору (контракту), способ отправления и т.д.)</font> Договор № {{ agrm_num }} от {{ agrm_date }}<br />
<table border="1">
	<tr align="center">
		<td align="center" width="23%" rowspan="2">
		<font size="9">
			Наименование товара<br />(описание выполненных работ, оказанных услуг), имущественного права
		</font>
		</td>
		<td align="center" width="11%" colspan=2>
		<font size="9">
			Единица<br />измерения
		</font>
		</td>
		<td align="center" width="5%" rowspan="2">
		<font size="9">
			Коли-<br />чество (объем)<br />
		</font>
		</td>
		<td align="center" width="7%" rowspan="2">
		<font size="9">
			Цена (тариф) за единицу измерения<br />
		</font>
		</td>
		<td align="center" width="10%" rowspan="2">
		<font size="9">
			Стоимость товаров (работ, услуг), имущественных прав без налога — всего<br />
		</font>
		</td>
		<td align="center" width="5%" rowspan="2">
		<font size="9">
			В том числе сумма акциза<br />
		</font>
		</td>
		<td align="center" width="6%" rowspan="2">
		<font size="9">
			Налоговая ставка<br />
		</font>
		</td>
		<td align="center" width="7%" rowspan="2">
		<font size="9">
			Сумма налога, предъявляе-<br />мая покупателю<br />
		</font>
		</td>
		<td align="center" width="10%" rowspan="2">
		<font size="9">
			Стоимость товаров (работ, услуг), имущественных прав с налогом — всего<br />
		</font>
		</td>
		<td align="center" width="12%" colspan=2>
		<font size="9">
			Страна происхождения товара<br />
		</font>
		</td>
		<td align="center" width="7%" rowspan="2">
		<font size="9">
			Номер таможенной декларации<br />
		</font>
		</td>
	</tr>
	<tr align="center">
		<td width="3%" align="center">
		<font size="8">
			к<br />о<br />д<br />
		</font>
		</td>
		<td width="8%" align="center">
		<font size="8">
			условное обозначение (национальное)<br />
		</font>
		</td>
		<td width="4%" align="center">
		<font size="8">
			цифро-<br />вой код<br />
		</font>
		</td>
		<td width="8%" align="center">
		<font size="8">
			краткое наименование<br />
		</font>
		</td>
	</tr>
	<tr align="center">
		<td width="23%">
			<font size="8">1</font>
		</td>
		<td width="3%">
			<font size="8">2</font>
		</td>
	        <td width="8%">
                        <font size="8">2а</font>
                </td>
		<td width="5%">
			<font size="8">3</font>
		</td>
		<td width="7%">
			<font size="8">4</font>
		</td>
		<td width="10%">
			<font size="8">5</font>
		</td>
		<td width="5%">
			<font size="8">6</font>
		</td>
		<td width="6%">
			<font size="8">7</font>
		</td>
		<td width="7%">
			<font size="8">8</font>
		</td>
		<td width="10%">
			<font size="8">9</font>
		</td>
		<td width="4%">
			<font size="8">10</font>
		</td>
		<td width="8%">
                        <font size="8">10а</font>
                </td>
		<td width="7%">
			<font size="8">11</font>
		</td>
	</tr>
<!-- begin_services -->
<!-- begin_item -->
{% for fee_line in monthly_fees %}
<tr>
		<td width="23%">{{ fee_line.name }} {% if fee_line.period %}{{ fee_line.period }}.{{ fee_line.month_pad }}.{{ fee_line.year }}{% endif %}</td>
		<td width="3%" align="center">{{ fee_line.code_number }}</td>
		<td width="8%" align="center">{{ fee_line.code_name }}</td>
		<td width="5%" align="right">{{ fee_line.quantity }}</td>
		<td width="7%" align="right">{{ fee_line.rate_netto|floatformat:2 }}</td>
		<td width="10%" align="right">{{ fee_line.cost_netto|floatformat:2 }}</td>
		<td width="5%" align="center">Без акциза</td>
		<td width="6%" align="right">{{ vat_rate }}%</td>
		<td width="7%" align="right">{{ fee_line.vat_line_total|floatformat:2 }}</td>
		<td width="10%" align="right">{{ fee_line.cost_brutto|floatformat:2 }}</td>
		<td width="4%" align="center">--</td>
		<td width="8%" align="center">--</td>
		<td width="7%" align="center">--</td>
</tr>
{% endfor %}
<!-- end_item -->
<!-- end_services -->
<tr>
		<td width="46%" colspan=5>Всего к оплате:</td>		
		<td width="10%" align="right">{{ total_netto|floatformat:2 }}</td>
		<td width="11%" align="center" colspan="2">X</td>
		<td width="7%" align="right">{{ total_vat|floatformat:2 }}</td>
		<td width="10%" align="right">{{ total_brutto|floatformat:2 }}</td>
	</tr>	
</table>
<br />
<table>
	<tr>
		<td width="50%">
			Руководитель организации<br />
			или иное уполномоченное лицо ________________ ({{ oper_dir }})<br />
			<table border="0">
				<tr>
					<td width="50%" align="right"><font size=6>(подпись)</font></td>
					<td width="33%" align="center"><font size=6>(ф.и.о.)</font></td>
				</tr>
                                {% if oper_dov %}
            			<tr>
                                        <td width="90%" align="right"><h5>{{ oper_dov }}</h5></td>
                                </tr>
                                {% endif %}
			</table>			
		</td>
		<td width="50%">
			Главный бухгалтер<br />
			или иное уполномоченное лицо ________________ ({{ oper_buh }})<br />
			<table border="0">
				<tr>
					<td width="50%" align="right"><font size=6>(подпись)</font></td>
					<td width="33%" align="center"><font size=6>(ф.и.о.)</font></td>
                                </tr>
                                {% if oper_dov %}
                                <tr>
                                        <td width="90%" align="right"><h5>{{ oper_dov }}</h5></td>
                                </tr>
                                {% endif %}
			</table>	
		</td>
	</tr>
</table>
<br />
{{ comment1 }}
<br />
Примечание. Первый экземпляр — покупателю, второй экземпляр — продавцу
