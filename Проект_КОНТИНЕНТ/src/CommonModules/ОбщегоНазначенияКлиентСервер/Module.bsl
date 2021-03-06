// Добавление элемента компоновки в контейнер элементов компоновки
// Параметры:
//  ОбластьДобавления - контейнер с элементами и группами отбора, например
//                  Список.Отбор или группа в отборе
//  ИмяПоля - строка - имя для поля компоновки данных
//  ВидСравнения - ВидСравненияКомпоновкиДанных - вид сравнения
//  ПравоеЗначение - произвольный
//  Представление - представление элемента компоновки данных
//  Использование - булево - использование элемента
//  РежимОтображения - РежимОтображенияЭлементаНастройкиКомпоновкиДанных - режим отображения
//
Функция ДобавитьЭлементКомпоновки(ОбластьДобавления,
									знач ИмяПоля,
									знач ВидСравнения,
									знач ПравоеЗначение = Неопределено,
									знач Представление  = Неопределено,
									знач Использование  = Неопределено,
									знач РежимОтображения = Неопределено) Экспорт
	
	Элемент = ОбластьДобавления.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	Элемент.ЛевоеЗначение = Новый ПолеКомпоновкиДанных(ИмяПоля);
	Элемент.ВидСравнения = ВидСравнения;
	
	Если РежимОтображения = Неопределено Тогда
		Элемент.РежимОтображения = РежимОтображенияЭлементаНастройкиКомпоновкиДанных.Недоступный;
	Иначе
		Элемент.РежимОтображения = РежимОтображения;
	КонецЕсли;
	
	Если ПравоеЗначение <> Неопределено Тогда
		Элемент.ПравоеЗначение = ПравоеЗначение;
	КонецЕсли;
	
	Если Представление <> Неопределено Тогда
		Элемент.Представление = Представление;
	КонецЕсли;
	
	Если Использование <> Неопределено Тогда
		Элемент.Использование = Использование;
	КонецЕсли;
	
	Возврат Элемент;
	
КонецФункции

// Изменение элементов отбора
// Параметры
//  ИмяПоля - строка - имя поля компоновки
//  ВидСравнения - ВидСравненияКомпоновкиДанных - вид сравнения
//  ПравоеЗначение - произвольный
//  Представление - строка - представление элемента компоновки данных
//  Использование - булево - использование элемента
//  РежимОтображения - РежимОтображенияЭлементаНастройкиКомпоновкиДанных - режим отображения
//
Функция ИзменитьЭлементыОтбора(ОбластьПоиска,
								знач ИмяПоля = Неопределено,
								знач Представление = Неопределено,
								знач ПравоеЗначение = Неопределено,
								знач ВидСравнения = Неопределено,
								знач Использование = Неопределено,
								знач РежимОтображения = Неопределено) Экспорт
	
	Если ЗначениеЗаполнено(ИмяПоля) Тогда
		ЗначениеПоиска = Новый ПолеКомпоновкиДанных(ИмяПоля);
		СпособПоиска = 1;
	Иначе
		СпособПоиска = 2;
		ЗначениеПоиска = Представление;
	КонецЕсли;
	
	МассивЭлементов = Новый Массив;
	
	НайтиРекурсивно(ОбластьПоиска.Элементы, МассивЭлементов, СпособПоиска, ЗначениеПоиска);
	
	Для Каждого Элемент Из МассивЭлементов Цикл
		Если ИмяПоля <> Неопределено Тогда
			Элемент.ЛевоеЗначение = Новый ПолеКомпоновкиДанных(ИмяПоля);
		КонецЕсли;
		Если Представление <> Неопределено Тогда
			Элемент.Представление = Представление;
		КонецЕсли;
		Если Использование <> Неопределено Тогда
			Элемент.Использование = Использование;
		КонецЕсли;
		Если ВидСравнения <> Неопределено Тогда
			Элемент.ВидСравнения = ВидСравнения;
		КонецЕсли;
		Если ПравоеЗначение <> Неопределено Тогда
			Элемент.ПравоеЗначение = ПравоеЗначение;
		КонецЕсли;
		Если РежимОтображения <> Неопределено Тогда
			Элемент.РежимОтображения = РежимОтображения;
		КонецЕсли;
	КонецЦикла;
	
	Возврат МассивЭлементов.Количество();
	
КонецФункции

Процедура НайтиРекурсивно(КоллекцияЭлементов, МассивЭлементов, СпособПоиска, ЗначениеПоиска)
	
	Для каждого ЭлементОтбора Из КоллекцияЭлементов Цикл
		
		Если ТипЗнч(ЭлементОтбора) = Тип("ЭлементОтбораКомпоновкиДанных") Тогда
			
			Если СпособПоиска = 1 Тогда
				Если ЭлементОтбора.ЛевоеЗначение = ЗначениеПоиска Тогда
					МассивЭлементов.Добавить(ЭлементОтбора);
				КонецЕсли;
			ИначеЕсли СпособПоиска = 2 Тогда
				Если ЭлементОтбора.Представление = ЗначениеПоиска Тогда
					МассивЭлементов.Добавить(ЭлементОтбора);
				КонецЕсли;
			КонецЕсли;
		Иначе
			
			НайтиРекурсивно(ЭлементОтбора.Элементы, МассивЭлементов, СпособПоиска, ЗначениеПоиска);
			
			Если СпособПоиска = 2 И ЭлементОтбора.Представление = ЗначениеПоиска Тогда
				МассивЭлементов.Добавить(ЭлементОтбора);
			КонецЕсли;
			
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

// Используется для создания элемента отбора или, если таковой не найден,
// установления существующим элементам свойств
// Параметры
//  ОбластьПоискаДобавления - контейнер с элементами и группами отбора, например
//                  Список.Отбор или группа в отборе
//  ИмяПоля - строка - имя для поля компоновки данных (заполняется всегда)
// Устанавливаемые поля:
//  ВидСравнения - ВидСравненияКомпоновкиДанных - вид сравнения
//  ПравоеЗначение - произвольный
//  Представление - представление элемента компоновки данных
//  Использование - булево - использование элемента
//  РежимОтображения - РежимОтображенияЭлементаНастройкиКомпоновкиДанных - режим отображения
//
Процедура УстановитьЭлементОтбора(ОбластьПоискаДобавления,
								знач ИмяПоля,
								знач ПравоеЗначение = Неопределено,
								знач ВидСравнения = Неопределено,
								знач Представление = Неопределено,
								знач Использование = Неопределено,
								знач РежимОтображения = Неопределено) Экспорт
	
	ЧислоИзмененных = ИзменитьЭлементыОтбора(ОбластьПоискаДобавления, ИмяПоля, Представление,
							ПравоеЗначение, ВидСравнения, Использование, РежимОтображения);
	
	Если ЧислоИзмененных = 0 Тогда
		Если ВидСравнения = Неопределено Тогда
			ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
		КонецЕсли;
		ДобавитьЭлементКомпоновки(ОбластьПоискаДобавления, ИмяПоля, ВидСравнения,
								ПравоеЗначение, Представление, Использование, РежимОтображения);
	КонецЕсли;
	
КонецПроцедуры
