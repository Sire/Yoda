-- PostgreSQL doesn't use # as comment
select jsoncol #> array['p1', 'p2']
from some_table
where col#-'{1, a}' @? '$.b ? (@ > 0)';

SELECT

  'Single quoted string' AS test01,
  'Backslashes in single-quoted strings are interpreted literally and get no highlighting: \ ' AS test02,
  'The single-quote character can be escaped by using two of them: '' This is highlighted.' AS test03,
  'Line breaks
are allowed' AS test04,

  E'Escape strings are introduced with an uppercase E…' AS test11,
  e'or a lowercase e.' AS test12,
  E'Line breaks
are allowed' AS test13,
  E'The single-quote character can be escaped by using two of them: '' This is highlighted.' AS test14,
  E'They can have escapes like \t or three-digit octal \011 or two-digit hexadecimal \x09.' AS test15,
  E'Also the escape character itself and the single-quote can be escaped: \\ and \' are highlighted.' AS test16,
  E'Non-defined combinations: Example: \y is highlighted because it’s treated as escaped characters and substituted by “y”. Even before a line break\
this is possible.' AS test17,
  E'Higher Unicode code points: Hex: Four-digit \u1234 and eight-digit \U00001234' AS test18,
  E'These escapes with “u” and “U” are the only one that are not error tolerant: \u123 and \u123 are highlighted as errors.' AS test19,

  U&'Unicode escape strings are introduced with an uppercase U…' AS test21,
  u&'or a lowercase u.' AS test22,
  U&'The single-quote character can be escaped by using two of them: '' This is highlighted.' AS test23,
  U&'Types of escape: \0061 and \+000061 and \\' AS test24,
  U&'All other usages of \ are errors, including \' test25,
  U&'Line breaks
are allowed' AS test26,

  U&'User-defined escape characters can be used instead of \ by specifying' UESCAPE 'w' AS test31,
  U&'Here, \ behaves as normal character. Escape sequences: w0061 and w+000061 and ww' UESCAPE 'w' AS test32,
  U&'Also work correctly for escape characters that have a special meaning in Regular Expressions: .0061 .+000061 and ..' UESCAPE '.' AS test33,

  0 AS U&"Unicode escape identifiers are introduces with an uppercase U…",
  0 AS u&"or a lowercase u.",
  0 AS U&"The double-quote character can be escaped by using two of them: "" This is highlighted.",
  0 AS U&"Types of escape: \0061 and \+000061 and \\",
  0 AS U&"All other usages of \ are errors, including \",
  0 AS U&"Line breaks
are allowed"

  power(2, 3) AS test31,            -- PostgreSQL Build-in functions (like “power”) are highlighted when followed by an opening parenthesis…
  power AS test32, 0 AS power,      -- …but not highlighted if used as identifier.
  ST_PointOnSurface(way) AS test33, -- PostGIS functions are highlighted as extensions.

  -- User-defined functions get no special highlighting:
  testpower(2, 3) AS test34,

  foo AS bar

FROM mytable;