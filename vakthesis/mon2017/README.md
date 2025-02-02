README
mon2017dev, оформлення дисертації згідно з вимогами МОН, 2024/03/03 v0.10

ВІД УКЛАДАЧА
============

Це версія набору пакетів для написання авторефератів та дисертацій
згідно вимог Вищої атестаційної комісії, взятий з
https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/ з перекодованими
в UTF-8 символами для зручнішого користування на сучасних системах.

КОРОТКИЙ ОПИС
=============

Набір LaTeX-класів mon2017dev призначений
для підготовки дисертації згідно з Вимогами до оформлення дисертації,
затвердженими наказом Міністерства освіти і науки від 12.01.2017 № 40
(набрав чинності 10.03.2017),
  https://zakon.rada.gov.ua/go/z0155-17
з урахуванням змін, внесених згідно з
наказом Міністерства освіти і науки від 31.05.2019 № 759
(зміни винятково юридичні, немає потреби змінювати LaTeX-клас).

Основні можливості:
-- оформлення титульного аркуша згідно з Вимогами,
-- підтримка анотації і списку ключових слів двома мовами,
-- повтор списку публікацій здобувача з анотації
   у списку використаних джерел і в додатку,
-- повтор відомостей про апробацію зі вступу в додатку,
-- оформлення автореферату, узгоджене з оформленням дисертації,
-- підключення окремих модулів для підтримки специфічних вимог до оформлення.


ЩО НОВОГО У ВЕРСІЇ 0.10
=======================

Додано:

-- У кінці файла анотації mon2017dev-abs.tex коментар з детальним поясненням,
   як забезпечити автоматичне копіювання списку публікацій здобувача з анотації
   в додаток, якщо цей список створено вручну.
   (Микола Мороз звернув увагу на таку проблему,
   що створений вручну список публікацій не копіюється автоматично.)

-- У файлах-прикладах таблицю відповідності
   стилів оформлення списку наукових публікацій з рекомендованого переліку
   (додаток 3 до Вимог до оформлення дисертації)
   і доступних BibTeX-стилів.
   Зокрема вона містить гіперпосилання на сучасну реалізацію BibTeX-стилів,
   що відповідають вимогам стандарту ДСТУ 8302:2015.
   (Дмитро Терлецький запропонував додати таку інформацію про відповідність;
   basilio повідомив про сучасну BibTeX-реалізацію ДСТУ 8302:2015:
   https://linux.org.ua/index.php?topic=689.msg204774#msg204774)

-- У файлах-прикладах можливість підключати пакунок cmap,
   що розв'язує проблему з копіюванням «нісенітниці» замість кириличних букв
   у згенерованому PDF-файлі.
   (Це незалежно пропонували в різний час кілька людей,
   зокрема Микола Мороз, Олексій Панасенко і Геннадій Порєв.)

-- У файлах-прикладах можливість підключати пакунок pdfx,
   що дає змогу генерувати PDF-файл, сумісний зі стандартом PDF/A,
   згідно з вимогами Порядку присудження ступеня доктора філософії
   та скасування рішення разової спеціалізованої вченої ради
   закладу вищої освіти, наукової установи
   про присудження ступеня доктора філософії
   (Микола Мороз запропонував це.)

Змінено:

-- У файлах-прикладах BibTeX-стилі gost2008 і spmpsci
   на стандартний BibTeX-стиль ieeetr,
   який має бути доступний у будь-якій TeX-системі,
   і відповідно вилучено недоступне гіперпосилання,
   за яким раніше можна було звантажити BibTeX-стилі Springer MathPhys.
   (Сергій Дмитренко звернув увагу на недоступне гіперпосилання.)

Виправлено:

-- Кілька незадовільних розривів рядка у файлах-прикладах.


ЗВАНТАЖЕННЯ
===========

Найновішу версію mon2017dev можна отримати за адресою
  https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/mon2017dev/

Архів mon2017dev-0.10.zip містить усі потрібні файли:
  README                (цей файл)
  mon2017dev.cls        LaTeX-клас для оформлення дисертації
  mon2017dev-aref.cls   LaTeX-клас для оформлення автореферату
  mon2017dev.*.clo      модулі для підтримки специфічних вимог до оформлення
  casus2017dev.sty      доповнення до пакунка casus
  specsci*.{uk,en}.csv  файли відповідності шифру і назви спеціальності
  specedu*.{uk,en}.csv    (для різних переліків спеціальностей і різними мовами)
  mon2017dev.tex        приклад головного файла дисертації
  mon2017dev-abs.tex    приклад анотації
  mon2017dev-intro.tex  приклад вступу до дисертації
  mon2017dev-bib.tex    приклад списку використаних джерел
  mon2017dev-app1.tex   приклад додатку зі списком публікацій
                          та відомостями про апробацію
  mon2017dev.pdf        приклад головного файла дисертації
                          (попередньо згенерований PDF-файл)
  mon2017dev-aref.tex   приклад файла автореферату дисертації
  mon2017dev-aref.pdf   приклад файла автореферату дисертації
                          (попередньо згенерований PDF-файл)


ЗАЛЕЖНОСТІ
==========

Це допоміжні LaTeX-класи (надбудова над класом vakthesis/vakaref відповідно).
Тому вони працюють тільки разом з набором класів і пакунків LaTeX vakthesis:
викликають клас vakthesis/vakaref, а потім переозначують потрібні команди.
Для відмінювання назв установ потрібен пакунок casus з цього набору.
Набір класів і пакунків LaTeX vakthesis треба звантажити за адресою
  https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/
і встановити згідно з інструкцією.

Для підтримки кількох мов в одному документі
потрібен пакунок babel,
що доступний за адресою
  CTAN:macros/latex/required/babel

Для створення команд і опцій класу з інтерфейсом ключ=значення
потрібен пакунок xkeyval,
що доступний за адресою
  CTAN:macros/latex/contrib/xkeyval

Щоб переносити вміст оточення з однієї частини документа в іншу,
потрібен пакунок environ,
що доступний за адресою
  CTAN:macros/latex/contrib/environ
Це використовується, щоб повторити відомості про апробацію зі вступу в додатку.
Навіть якщо користувач не зважає на можливості автоматизації
(вручну робить повтори),
клас mon2017dev все одно викликає цей пакунок,
а отже, він має бути встановлений у системі.

Для означення команд з модифікаторами (uk), (en) тощо
потрібен пакунок suffix,
що доступний за адресою
  CTAN:macros/latex/contrib/bigfoot

Для роботи з CSV-файлами
потрібен пакунок datatool,
що доступний за адресою
  CTAN:macros/latex/contrib/datatool

Для роботи з рядками (вирізання, порівняння тощо)
потрібен пакунок xstring,
що доступний за адресою
  CTAN:macros/generic/xstring

Для включення факсимільних підписів і роботи з ілюстраціями, кольором тощо
потрібен пакунок graphicx,
що доступний за адресою
  CTAN:macros/latex/required/graphics

Пакунки babel і graphicx, найімовірніше, уже встановлені у вашій системі.
Решту пакунків можна встановити (якщо вони ще не встановлені)
засобами менеджера пакунків вашого дистрибутиву TeX
або засобами менеджера пакунків операційної системи.

У користувача є потреба безпосередньо працювати хіба що з babel і graphicx.
Решту пакунків викликає клас без участі користувача.


ВСТАНОВЛЕННЯ
============

Варіант 1
---------

1. Помістити файли туди, де TeX може їх знайти, наприклад:
   *.cls, *.clo, *.sty, *.csv  ->  TEXMF/tex/latex/vakthesis/mon2017dev/
   README                      ->  TEXMF/doc/latex/vakthesis/mon2017dev/
   mon2017dev*.{tex,pdf}       ->  TEXMF/doc/latex/vakthesis/mon2017dev/example/
   Тут TEXMF позначає кореневий каталог (локального) дерева texmf.

2. Оновити базу імен файлів.

Варіант 2
---------

Помістити файли *.cls, *.clo, *.sty, *.csv у той самий каталог,
де лежать файли дисертації.


ВИКОРИСТАННЯ
============

Викликати, як стандартний клас документа:
  \documentclass{mon2017dev}
або
  \documentclass{mon2017dev-aref}
Звернути увагу, які команди й оточення використовуються для задання
назви дисертації, імені здобувача тощо
(див. файли прикладів mon2017dev*.tex).


АВТОРСЬКЕ ПРАВО І ЛІЦЕНЗІЯ
==========================

Copyright 2018–2021, 2024 Олександр М. Барановський (Oleksandr M. Baranovskyi)

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status `author-maintained'.

[Приблизний переклад українською:
Цю роботу можна розповсюджувати і/або модифікувати за
умовами публічної ліцензії проекту LaTeX, або версії 1.3
цієї ліцензії, або (на ваш розсуд) будь-якої пізнішої версії.
Найновіша версія цієї ліцензії є на
  http://www.latex-project.org/lppl.txt
і версія 1.3 або пізніша є частиною всіх дистрибутивів LaTeX
версії 2005/12/01 або пізніших.

Ця робота має LPPL-статус підтримки «підтримується автором».]


МОЖЛИВІ ТРУДНОЩІ
================

Вимоги до оформлення дисертації виписані не дуже чітко.
Інколи незрозуміло, що і як треба запрограмувати.
Деякі речі просто ще не реалізовані.
Тому користувачі мають знати про можливі труднощі.

 1.+Якщо установа, де здійснювалася підготовка здобувача,
    і установа, де проводився захист дисертації, -- та сама установа,
    то як писати на титульному аркуші дисертації?
    Повторювати двічі?
    Писати назву установи, де здійснювалася підготовка здобувача?
    Писати назву установи, де проводився захист дисертації?
    (Вони однакові, але треба запрограмувати, аргумент якої команди брати.)

    Аналогічна ситуація з анотацією.
    Але, крім того, в п. 2 Вимог написано, що в анотації також вказуються
    «найменування вищого навчального закладу або найменування наукової установи,
    у якому (якій) здійснювалася підготовка;
    найменування наукової установи або найменування вищого навчального закладу,
    у спеціалізованій вченій раді якої (якого) відбудеться захист»,
    а в зразку анотації (додаток 2) вказано тільки одну установу
    (де здійснювалася підготовка).

    На мій погляд, повторювати двічі ту саму інформацію -- неприродно.
    Серед дисертацій, які я переглянув, є такі, де не повторюють.
    Але, наприклад, науково-консультаційний центр
    Київського національного університету імені Тараса Шевченка
    пропонує дисертантам «Вимоги до оформлення дисертації»:
      http://scc.knu.ua/upload/iblock/ebf/Vymogy.docx
    (це копія наказу МОН, але з деякими локальними вставками),
    де на титульному аркуші двічі написано:
      Київський національний університет імені Тараса Шевченка
                Міністерство освіти і науки України
    хоча в анотації повторів немає.

    У нинішній версії класу команда \institution задає
    назву установи, де здійснювалася підготовка здобувача,
    а обов'язковий аргумент команди \council задає
    лише шифр спеціалізованої вченої ради.
    Тобто припускається, що раду створено в тій самій установі
    (і немає потреби писати ще раз назву установи).
    Але ця команда має ще й факультативний аргумент,
    у якому у форматі ключ=значення можна задати
    назву установи, де створено раду
    (тобто назву установи, де проводиться захист дисертації).
    Тоді на титульному аркуші й в анотації буде написано обидві установи.
    За бажання користувач може тут вказати ту саму установу,
    що й в аргументі команди \institution,
    і отримати повтор, як у Вимогах КНУ.

    Якщо ж не використовувати факультативний аргумент команди \council,
    то на титульному буде тільки назва установи, задана командою \institution.
    Це логічно, раніше на титульному аркуші дисертації писали якраз
    назву установи, де здійснювалася підготовка здобувача,
    а на титульному аркуші автореферату --
    назву установи, де проводиться захист дисертації.

 2.+Оскільки у зразку титульного аркуша дисертації спочатку згадано
    найменування вищого навчального закладу або наукової установи,
    а потім -- органу, до сфери управління якого належить заклад, установа,
    може, треба у такому порядку й писати?
                    Інститут педагогіки
      Національної академії педагогічних наук України
    а не
      Національна академія педагогічних наук України
                    Інститут педагогіки

    Текст наказу і зразок не вказують чітко, у якому порядку писати назви.
    Чому в зразку вони згадуються у такому (незвичному) порядку, незрозуміло.
    Наприклад, у формі обкладинки атестаційної справи
    здобувача ступеня доктора філософії,
    затвердженої наказом Міністерства освіти і науки від 22.04.2019 № 533
      https://zakon.rada.gov.ua/go/z0474-19#n16
    вказано інший порядок:
                         Підпорядкування
      Найменування закладу вищої освіти (наукової установи),
                в якому відбувся захист дисертації

    У дисертаціях, які я переглянув, пишуть по-різному.
    Тому в нинішній версії класів додано опцію instnameorder,
    яка дає змогу вибрати порядок розміщення на титульному аркуші
    назви установи і назви органу, до сфери управління якого належить установа.

 3.+Мабуть, потрібна підтримка «Переліку наукових спеціальностей»
      https://zakon.rada.gov.ua/go/z1133-11
    і «Переліку галузей знань і спеціальностей,
    за якими здійснюється підготовка здобувачів вищої освіти»
      https://zakon.rada.gov.ua/go/266-2015-п
    Незрозуміло, що треба використовувати:
    у зразку титульного аркуша дисертації йдеться про галузь знань,
    але у зразку анотації наведено і наукову спеціальність,
    за якою проводиться захист дисертації,
    і спеціальність, за якою здійснюється підготовка здобувачів вищої освіти.

    У згаданій вище формі обкладинки атестаційної справи
    здобувача ступеня доктора філософії
    уже чітко написано, що треба вказувати код і найменування спеціальності
    відповідно до Переліку галузей знань і спеціальностей,
    за якими здійснюється підготовка здобувачів вищої освіти,
    а також галузь знань за цим переліком.

    Тому я зупинився на такому варіанті:
    для дисертації на здобуття ступеня доктора філософії
    (а також інших ступенів, передбачених Законом України «Про вищу освіту»:
    доктора мистецтва і доктора наук)
    природно вказувати на титульному аркуші
    код і найменування спеціальності, а також галузь знань
    за відповідним переліком для здобувачів вищої освіти
    (саме це, ймовірно, і передбачає зразок у Вимогах).

    Але нині ще захищають дисертації люди, які почали підготовку раніше.
    Вони здобувають ступінь кандидата чи доктора, скажімо, фізико-математичних наук.
    Для таких дисертацій природніше писати на титульному аркуші
    шифр і назву спеціальності за відповідним переліком наукових спеціальностей
    і не писати відповідну галузь науки
    (навіть якщо це формально ніби й суперечить Вимогам).
    Бо нижче пишеться:
      Подається на здобуття наукового ступеня
      кандидата/доктора фізико-математичних наук.
    Тому видається надлишковим ще й після спеціальності писати:
      Фізико-математичні науки.

    У дисертаціях бачив по-різному (бо зразок у Вимогах незрозумілий):
    на титульному аркуші пишуть шифр і назву спеціальності за одним переліком,
    а нижче -- за другим;
    або шифр і назву спеціальності за одним переліком,
    а нижче -- галузь знань за другим.

    На мій погляд, обидва варіанти нелогічні.
    Перший, бо те, що науковий ступінь кандидата фізико-математичних наук
    згідно із законодавством прирівнюється до ступеня доктора філософії,
    не означає, що дисертант, який пройшов підготовку на кандидата наук,
    після захисту здобуває ступінь доктора філософії.
    Логічніше припустити,
    що в зразку анотації написано два варіанти в одному рядку:
    для кандидата наук і для доктора філософії.
    Для відповідної дисертації треба вибрати один з варіантів.

    Другий, бо один перелік ніяк не пов'язаний з іншим юридично
    (це також можна сказати і про перший варіант).
    Звісно, логічно пов'язати, скажімо, спеціальність «Математичний аналіз» в одному
    і галузь знань «Математика і статистика» в іншому переліку.
    Але це тільки особиста думка.
    Якщо я правильно розумію,
    коли всі «старі» кандидати і доктори наук захистяться,
    «Перелік наукових спеціальностей» більше не будуть використовувати взагалі.

    Тому в нинішній версії класів є дві команди:
    \specialitysci і \specialityedu
    для відповідних переліків спеціальностей.
    А також додано опцію класу type у форматі ключ=значення,
    що дає змогу вибрати тип дисертації.
    Подробиці див. у файлі mon2017dev.tex.

    Але у версії 0.04 додано можливість
    використовувати обидві команди \specialitysci і \specialityedu одночасно.
    Тоді на титульному аркуші й в анотації
    буде написано шифри й назви спеціальностей за обома переліками,
    а для типу дисертації c ще й ступінь у вигляді
    «кандидата ... наук (доктора філософії)».

    За словами Артема Чуйкова, який запропонував додати такий «змішаний» ступінь,
    в Інституті математики НАН України допустимі обидва варіанти оформлення.

 4.+Команди, що задають інформацію для титульного аркуша, яка не залежить від мови,
    треба писати за межами оточень uk, en тощо
    (чи оточень otherlanguage з параметрами ukrainian, english тощо).
    Це, наприклад, команда \udc;
    код УДК однаковий для українського і англійського тексту.
    Якщо ці команди розмістити всередині вказаних оточень,
    то цю інформацію не буде передано до \maketitle
    і її не буде на титульному аркуші.
    (Ольга Свинчук повідомила про це.)

    Це не велике обмеження,
    бо немає потреби задавати такі команди по-різному для різних мов.
    Але у майбутньому треба зробити безпечну обробку таких ситуацій
    (принаймні повідомлення про помилку для користувача).

    У нинішній версії класів команди, які мають бути доступні двома мовами,
    переписані так, що механізм \captions<languagename> (з пакунка babel)
    і оточення uk, en (оточення otherlanguage з параметрами ukrainian, english)
    не використовуються,
    а отже, цієї проблеми вже немає.

 5. Немає підтримки розбиття списку публікацій здобувача на групи:
    -- праці, в яких опубліковані основні наукові результати дисертації;
    -- праці, які засвідчують апробацію матеріалів дисертації;
    -- праці, які додатково відображають наукові результати дисертації.

    Взагалі кажучи, не сказано явно,
    що публікації треба ділити на такі групи і явно позначати такий поділ.
    Важливо, щоб саме в такій послідовності.
    Справді, у п. 13 Вимог написано:
    «Вказуються наукові праці автора у послідовності,
    наведеній у пункті 4 розділу ІІІ цих Вимог»

    За потреби можна робити це вручну.
    Можливо, якісь спеціалізовані пакунки будуть працювати з цим класом
    (bibtopic тощо)?

 6. Незрозуміло, навіщо тричі повторювати список публікацій здобувача:
    -- в анотації після ключових слів (п. 4 Вимог);
    -- у списку використаних джерел (п. 9);
    -- в окремому обов'язковому додатку до дисертації (п. 13).

    Як посилатися на публікації здобувача у тексті дисертації?
    У п. 9 Вимог сказано, що в дисертації має бути
    «зроблено посилання на всі наукові праці здобувача, наведені в анотації».
    Тоді у списку публікацій здобувача після анотації має бути окрема схема нумерації
    (наприклад, додати до номера букву «а», що клас vakthesis дозволяє зробити),
    щоб посилання на них не плуталися з посиланнями на використані джерела.
    Крім того, «список цих праць має також міститися у списку використаних джерел».
    Але тоді у списку використаних джерел будуть джерела,
    на які немає посилань у тексті.
    Бо не можна посилатися одночасно на те саме джерело у одному й другому списку.
    Намагаючись надати якогось смислу цим незрозумілим вимогам,
    я вирішив, що посилання в тексті мають бути на список використаних джерел
    (читачу зручніше працювати з посиланнями на один список, а не на три).
    А списки публікацій після анотації і в додатку мають довідковий характер,
    тому на них немає посилань у тексті.
    Щоб уникнути певних технічних проблем,
    пов'язаних з повторним згадуванням тих самих джерел (multiply-defined labels),
    я переозначив команду \bibitem в анотації та в додатку так,
    що вона тільки генерує мітку, але не дозволяє посилання на неї.

    Мені траплялися дисертації, де навіть чотири списки публікацій здобувача,
    тобто в анотації -- двічі:
    українською -- після анотації українською,
    англійською -- після анотації англійською.
    Але, на мій погляд, це дивне трактування Вимог:
    анотація в дисертації одна (але кілька варіантів різними мовами),
    тому й список публікацій здобувача після анотації має бути один.
    Справді, у тексті Вимог скрізь ідеться про «анотацію», а не «анотації».

 7. Сподіваюся, класи сумісні
    з рекомендованими стилями оформлення списку наукових публікацій
    (вони не містять нічого навмисно, що могло би привести до несумісності).
    Але тестування класів проводилося
    тільки зі стандартним BibTeX-стилем ieeetr
    та стилями gost2008* (з набору gost) і spmpsci (Springer MathPhys).
    Виявилося, що класи з ними сумісні.
    Тестування з іншими BibTeX-стилями не проводилося.

 8. Список використаних джерел може бути
    в кінці кожного розділу основної частини дисертації.
    Поки що немає (можливо, ніколи й не буде) підтримки для цього.
    Не перевіряв, чи клас сумісний зі спеціальними пакунками LaTeX для цього.

 9. «Дисертацію друкують на одному або на двох (за бажанням) боках аркуша»
    (додаток 4 до Вимог).
    Немає якоїсь спеціальної підтримки для цього.
    Не перевіряв, чи працюватимуть стандартні засоби LaTeX (oneside, twoside).

10. Не рекомендовано поки що використовувати класи для документів,
    у яких головна мова -- не ukrainian (а english чи інша).
    Виникають незрозумілі проблеми, для розв'язання яких потрібно більше часу.

    До того ж, ще не всі службові слова перекладено
    (тільки ті, що використовуються в анотації).
    Але у Вимогах немає зразка анотації англійською мовою,
    тому мені не було на що орієнтуватися.

11. Можливо, класи не працюватимуть із XeLaTeX, LuaLaTeX і polyglossia.
    Бо для підтримки кількох мов використовуються засоби babel.
    Але тестування класів у такій ситуації не проводилося.

    Механізм \captions<languagename> (з пакунка babel) уже не використовується
    у нинішній версії класів.
    Але застереження залишається,
    якоїсь спеціальної підтримки для XeLaTeX, LuaLaTeX, polyglossia не передбачено.


КОНТАКТНА ІНФОРМАЦІЯ
====================

Повідомлення про помилки і пропозиції нових можливостей, будь ласка,
надсилайте супровіднику:
Олександр Барановський
ombaranovskyi at gmail dot com
