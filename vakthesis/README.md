README
vakthesis, набір класів і пакетів LaTeX, 2009/04/01 v0.08
In Ukrainian. See the end of the file for English summary.

ВІД УКЛАДАЧА
============

Це версія набору пакетів для написання авторефератів та дисертацій
згідно вимог Вищої атестаційної комісії, взятий з
https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/ з перекодованими
в UTF-8 символами для зручнішого користування на сучасних системах.

КОРОТКИЙ ОПИС
=============

Набір класів і пакетів LaTeX vakthesis призначений для оформлення
дисертації та автореферату за рекомендаціями ВАК України:
-- оформлення титульної сторінки дисертації (обкладинки автореферату),
-- оформлення заголовків розділів, підрозділів, пунктів, підпунктів,
   а також додатків,
-- нумерації сторінок, розділів (підрозділів і т. д.), ілюстрацій,
   таблиць, формул і т. д.,
-- оформлення підписів до ілюстрацій, таблиць,
-- оформлення теорем, лем, означень тощо,
-- оформлення списку використаних джерел та ін.

vakthesis дотримується рекомендацій ВАК України, викладених
у Довіднику здобувача наукового ступеня, що виданий ВАК України
у 2006 р. І тому ця версія може бути несумісна з новими вимогами ВАК
(2007 р. чи пізнішими). Якщо хтось має зісканований варіант
найновіших вимог ВАК до дисертацій і може поділитися зі мною, я був
би дуже вдячний і спробував внести відповідні зміни у наступні версії.
Також явні вказівки на розбіжності є дуже бажаними.


ЩО НОВОГО У ВЕРСІЇ 0.08
=======================

Зміни:
-- Додано опцію a3paper для підтримки формату паперу A3; вилучено
   непотрібні опції.
-- Змінено відступи у командах рубрикації.
-- Родо-нумераційний заголовок розділу оформлюється світлим
   і додається у зміст.
-- Змінено відступи у переліках, схему нумерації/літерації, символи
   у ненумерованих переліках.
-- Змінено вертикальні відступи у теоремах і доведеннях.
-- Змінено оформлення заголовка таблиці. Додано команди
   \tablenamefont і \tablecaptionfont для форматування заголовка
   таблиці.
-- Доповнено файл відповідності шифру та назви спеціальності.
-- Виправлено помічені мовні помилки і друкарські огріхи
   у документації.
-- Деякі інші дрібні зміни.

Виправлені баґи:
-- Додано безпечну обробку ситуації, коли файл size14.clo відсутній.
-- Змінено обробку команди \\ у аргументах команд рубрикації, щоб
   уникнути негативних наслідків її "крихкості".

Файли-приклади:
-- Додано приклад підключення додатків до головного файла дисертації.
-- Додано приклад таблиці до файла розділу дисертації.
-- Мова анотацій в авторефераті перемикається через otherlanguage*.


ЗВАНТАЖЕННЯ
===========

Найновіша версія набору vakthesis доступна за адресою
  http://www.imath.kiev.ua/~baranovskyi/tex/vakthesis
і складається з таких файлів
  README         (цей файл)
  vakthesis.dtx  документований код класів vakthesis, vakaref
                 та допоміжних файлів
  vakthesis.ins  інсталяційний файл
  vakthesis.pdf  попередньо скомпільована документація (цей файл не є
                 обов'язковим для звантаження і для розповсюдження,
                 він призначений лише для попереднього ознайомлення)


НЕОБХІДНІ КЛАСИ І ПАКЕТИ
========================

Для підтримки розміру шрифта 14pt потрібен файл size14.clo з набору
класів і пакетів extsizes, що доступний за адресою
  CTAN:macros/latex/contrib/extsizes
Достатньо встановити extsizes у системі. Немає потреби явно
використовувати якісь файли з цього набору.


ІНСТАЛЯЦІЯ
==========

  |Користувачам версій <0.07
  |-------------------------
  |
  |Всі попередні версії були приватними і вже не підтримуються.
  |Вони можуть бути несумісними з цією версією (змінено інтерфейс).
  |Тому я рекомендую користувачам попередніх версій:
  |* зробити резервні копії файлів встановленої версії класів
  |  і своїх документів,
  |* деінсталювати попередню версію,
  |* інсталювати поточну версію набору vakthesis,
  |* самостійно підправити свої документи так, щоб можна було
  |  використовувати поточну версію (документація може
  |  знадобитися для цього),
  |* якщо все гаразд, вилучити зроблені на першому кроці
  |  резервні копії.

1. «Розпакувати» .dtx-файл:
   latex vakthesis.ins

2. Якщо користувач бажає самостійно згенерувати документацію:
   latex vakthesis.dtx   
   або
   pdflatex vakthesis.dtx

3. Помістити файли туди, де TeX може їх знайти, наприклад (тут TEXMF
   позначає кореневий каталог (локального) дерева texmf):
   *.cls, *.sty, speciality.*  ->  TEXMF/tex/latex/vakthesis
   vakthesis.{dvi,pdf}, README ->  TEXMF/doc/latex/vakthesis
   xampl-*.*                   ->  TEXMF/doc/latex/vakthesis/example

4. Оновити базу імен файлів.


ВИКОРИСТАННЯ
============

Викликати, як стандартний клас документа:
  \documentclass{vakthesis}
або
  \documentclass{vakaref}
Більше інформації про нові та змінені опції та команди містить
документація: див. файл vakthesis.{dvi,pdf}.


АВТОРСЬКЕ ПРАВО І ЛІЦЕНЗІЯ
==========================

Copyright 2003--2009 Олександр М. Барановський (Oleksandr M. Baranovskyi)

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


МАНІФЕСТ
========

Ця робота складається з файлів:
  vakthesis.dtx
  vakthesis.ins
  README (цей файл)
і похідних файлів:
  vakthesis.cls
  vakaref.cls
  casus.sty
  speciality.20070212N70
  xampl-thesis.tex
  xampl-intro.tex
  xampl-ch1.tex
  xampl-concl.tex
  xampl-bib.tex
  xampl-aref.tex
  xampl-thesis.bib
  xampl-mybib.bib.


КОНТАКТНА ІНФОРМАЦІЯ
====================

Повідомлення про помилки і пропозиції нових можливостей, будь ласка,
надсилайте автору:
Олександр Барановський
ombaranovskyi at gmail dot com


ENGLISH SUMMARY
===============

The vakthesis LaTeX bundle is intended for typesetting theses in the
official format required by the VAK of Ukraine (Vyshcha Atestatsiyna
Komisiya, i.e., High Certification Committee). It consists of two
LaTeX document classes, vakthesis and vakaref, and a few auxiliary
files.

One can download the latest version of the vakthesis on
  http://www.imath.kiev.ua/~baranovskyi/tex/vakthesis
and use as any standard LaTeX document class.

This LaTeX bundle is distributed under the conditions of the LaTeX
Project Public License.

I suppose that the vakthesis bundle may be useful for Ukrainian users
only. So Ukrainian documentation is available only.

Please send bug reports and feature suggestions to author:
Oleksandr Baranovskyi
ombaranovskyi at gmail dot com
