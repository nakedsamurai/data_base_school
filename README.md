# project_minor


\documentclass{article}
\usepackage{mathtext}
\usepackage[T2A]{fontenc}
\usepackage[left=1.5cm,right=1.5cm,top=2cm,bottom=2cm,bindingoffset=0cm]{geometry}
\usepackage[russian,english]{babel}
\usepackage[utf8]{inputenc}
\usepackage{graphicx}
\usepackage{float}
\usepackage{wrapfig}
\usepackage[unicode, pdftex]{hyperref}
\usepackage[dvips]{graphicx}
\linespread{1.2}
\usepackage{amsmath}
\usepackage{pgfplots}
\usepackage{amsfonts}
\pgfplotsset{compat=1.9}
\begin{document}
\title{\href{https://github.com/stepanskiba/project_minor}{База данных ”Школа боевых искусств”}}
\date{}
\maketitle
Мы выбрали создание базы данных, связанной со школой боевых искусств, в которой будут доступны функции, которые привычно используются для сайтов различных спортивных комплексов. \\
Есть таблицы: тренера, абонементы, клиенты, виды боевых исскуств, приобретение абонемента, запись на тренировки.
\section{Доступная функциональность:}
  \begin{itemize}
  \item Выбор из разных абонементов, с разным количеством занятий.
  \item Расписание тренировок, с количеством свободных мест.
  \item Запись на тренировки, с уменьшением количества занятий на абонементе и свободных мест на ней.
  \item Возможность отмены записи на тренировку, с увеличением количества занятий на абонементе и свободных мест на ней.
  \item Просмотр списка клиентов и расписания тренировок.
\end{itemize}
\section{Специфичные ограничения:}
\begin{itemize}
  \item[$\circ$] Некоторые переменные должны быть больше или строго больше нуля(Например: стоимость, количество оставшихся тренировок, и т.д.)
  \item[$\circ$] Некоторые переменные должны быть целыми числами(Например: цена)
\end{itemize}


Для каждого клиента мы сохраняем данные:
\begin{itemize}
  \item имя
  \item номер
  \item электронную почту
  \item количество оставшихся тренировок
\end{itemize}
Также в базе присутсвуют связи:(Полный список свзяей представлен на схеме снизу(Figure 1))
\begin{itemize}
  \item[$\circ$] Клиент $\leftrightarrow$ запись на тренировку
  \item[$\circ$]Запись на тренировку $\leftrightarrow$ расписание занятий
  \item[$\circ$] Клиент $\leftrightarrow$ покупка абонемента
\end{itemize}
\section{Пример устройства таблицы:}
\begin{itemize}
  \item \begin{verbatim} training_schedule
\end{verbatim}
    \begin{itemize}
      \item \begin{verbatim} martial_art_name : varchar(50) - название занятия
\end{verbatim} 
      \item \begin{verbatim} training_date : date - день проведения занятия
\end{verbatim}
       \item \begin{verbatim} training_date : date - день проведения занятия
\end{verbatim}
       \item \begin{verbatim} start_time : time - начало занятия 
\end{verbatim}
    \end{itemize}
\end{itemize}  
   \begin{figure}
    \centering
    \includegraphics[width =0.7 \linewidth]{fig/diagram.png}
    \caption{Даталогическая модель}
    \label{fig:my_label}
\end{figure}
\end{document}
