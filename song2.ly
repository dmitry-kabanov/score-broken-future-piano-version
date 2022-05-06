\version "2.22.2"

\header {
  title = "I need a title herre"
  composer = "Dmitry I. Kabanov"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}


upper = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  
  r1 |
  \repeat volta 2 {
  r2 r4 e8 a |
  b2. c4 |
  a2 r4 e8 a |
  b2. e4 |
  c2 r4 e4 |
  b2 r4 r8 c8 |}
  \alternative {
  { a2 r2 | }
  { a2 r4. g8 | }
  }
  b2 r2 |
  
  % Part B
  e8 a, c e f d e c |
  e8 a, c e f d e c |
  g' e  f d e c d b |
  g' b, f' b, e b d4 |
  
  e8 a, c e f d e c |
  e8 a, c e f d e c |
  g' e  f d e c d b |
  e gis, d' gis, c gis b4 |
  
  a8 e a b c a b gis |
  a f a b c a b gis |
  a f a b c a b gis |
  a f e d c b a gis |
  
  a' e a b c a b gis |
  a f a b c a b gis |
  a f a b c a b c |
  e4 d c b |
  
  % Part C
  a2 r4 e8 a |
}

lower = \relative c {
  \clef bass
  \key a \minor
  \time 4/4
  a8 e' a e  a, e' a e |
  \repeat volta 2 {
    a, e' a e  a, e' a e |
    f, c' f c  f, c' f c |
    a8 e' a e  a, e' a e |
    f, c' f c  f, c' f c |
    c, g' c g  c, g' c g |
    e  b' e b  e, b' e b |
  }
  \alternative {
    { a  e' a e  a, e' a e | }
    { a, e' a e  a, e' a e | }
  }
  g, d' g d  g, d' g b |
  
  % Part B
  a, e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  c, g' c g  c, g' c g |
  g  d' g d  g, d' g b |
  
  a, e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  c, g' c g  c, g' c g |
  e  b' e b  e, b' e b |
  
  a  e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  d, a' d a  d, a' d a |
  e  b' e b  e, b' e b |
  
  a  e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  d, a' d a  d, a' d a |
  e  b' e b  e, b' e b |
  
  % Part C
  a  e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  a8 e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  c, g' c g  c, g' c g |
  e  b' e b  e, b' e b |
}

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}