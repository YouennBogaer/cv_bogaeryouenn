%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% resume.cls -- Classe de CV deux colonnes
%
% Dérivée de la classe « resume » de Trey Hunner, adaptée (mise en page en
% deux colonnes, environnements dédiés) pour ce CV.
%
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved.  This file is offered as-is,
% without any warranty.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/10/02 v1.0 Classe de CV deux colonnes]

% Les options (a4paper, ...) sont transmises à la classe article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PACKAGES

\RequirePackage[T1]{fontenc}        % Accents copiables depuis le PDF
\RequirePackage{lmodern}            % Police vectorielle pour l'encodage T1
\RequirePackage[french]{babel}      % Césure et typographie françaises
\RequirePackage[parfill]{parskip}   % Pas d'indentation des paragraphes
\RequirePackage[normalem]{ulem}     % \uline (titres de colonne gauche)
\RequirePackage[hidelinks]{hyperref} % Liens cliquables, sans cadre coloré
\hypersetup{pdflang=fr-FR}
\urlstyle{same}                     % \url dans la police du texte

\nofiles                            % Pas de fichier .aux
\pagestyle{empty}                   % Pas de numéro de page

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESPACEMENTS

\newcommand{\sectionskip}{\medskip}       % Avant chaque titre de section
\newcommand{\sectionlineskip}{\medskip}   % Entre un titre et son filet

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EN-TÊTE

% \rHeader{Nom}{Titre}{Sous-titre} : bloc centré en haut de page
\newcommand{\rHeader}[3]{%
  \begin{center}
    {\huge\bfseries #1}\\[2mm]
    {\large\bfseries #2}\\
    #3
  \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTES

% Liste à puces « · » ; l'argument optionnel règle l'espace entre éléments
\newenvironment{rBullets}[1][0.5em]{%
  \begin{list}{$\cdot$}{%
    \setlength{\leftmargin}{0.5em}%
    \setlength{\itemsep}{#1}%
  }%
}{%
  \end{list}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLONNE GAUCHE

% \begin{rLeftColSection}{Titre} : section avec titre souligné
\newenvironment{rLeftColSection}[1]{%
  \sectionskip
  \setlength{\ULdepth}{3pt}%
  \uline{\bfseries\MakeUppercase{#1}}%
  \vspace{3pt}%
  \begin{list}{}{\setlength{\leftmargin}{-0.5em}}%
  \item[]%
}{%
  \end{list}%
  \vspace{2mm}%
}

% \begin{rSkillGroup}{Catégorie} : groupe de compétences sans puce
\newenvironment{rSkillGroup}[1]{%
  \textbf{#1 :}%
  \begin{list}{}{%
    \setlength{\leftmargin}{0.5em}%
    \setlength{\itemsep}{0.1em}%
  }%
}{%
  \end{list}%
  \vspace{4pt}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLONNE DROITE

% \begin{rSection}{Titre} : section avec titre en capitales et filet
\newenvironment{rSection}[1]{%
  \sectionskip
  \textbf{\MakeUppercase{#1}}%
  \sectionlineskip
  \hrule
  \begin{list}{}{\setlength{\leftmargin}{1.5em}}%
  \item[]%
}{%
  \end{list}%
}

% \begin{rSubsection}{Intitulé}{Dates}{Sous-titre} : poste avec missions
% (\item) ; le sous-titre peut être laissé vide
\newenvironment{rSubsection}[3]{%
  \textbf{#1}\hfill #2%
  \ifx\relax#3\relax\else\\\textit{#3}\fi
  \smallskip
  \begin{rBullets}%
  \vspace{0.3em}%
}{%
  \end{rBullets}%
  \vspace{0.5em}%
}

% \rEntry{Intitulé}{Dates}{Description} : entrée courte sur deux lignes
\newcommand{\rEntry}[3]{%
  \textbf{#1}\hfill #2\\
  #3\par
}
