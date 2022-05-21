\version "2.22.2"

\header {
  title = "Broken Future"
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
  \tempo "Moderato" 4 = 94
  
  r1 |
  r2 r4 e8( a |
  \repeat volta 2 {
  b2. c4 |
  a2) r4 e8( a |
  b2. e4 |
  c2) r4 e4( |
  b2) r4 r8 c8( |
  }
  \alternative {
  { a2) r2 |
    r2 r4 \shape #'((0 . 0) (0 . 0) (1 . 0.5) (1 . 1)) Slur e8^( a) |
  }
  { 
    \shape #'((0 . 1.5) (0 . 1) (0 . 1) (0.3 . 0.5)) RepeatTie
    a2^\repeatTie r4. g8( |
    b2) r2 |
  }
  }
  
  % Part B
  e8( a, c e f d e c) |
  e8( a, c e f d e c) |
  g'( e  f d e c d b) |
  g'( b, f' b, e b d4) |
  
  e8( a, c e f d e c) |
  e8( a, c e f d e c) |
  g'( e  f d e c d b) |
  e( gis, d' gis, c gis b4) |
  
  a8( e a b c a b gis) |
  a( f a b c a b gis) |
  a( f a b c a b gis |
  a f e d c b a gis) |
  
  a'( e a b c a b gis) |
  a( f a b c a b gis) |
  a( f a b c a b c |
  e4 d c b |
  
  % Part C
  a2) r4 e8( a |
  b2. c4 |
  a2) r4 e8( a |
  b2. e4 |
  c2) r4 c4( |
  e,2) r4 e4( |
  c2) r4 r8 c8( |
  a1)~ |
  a1\fermata
}

lower = \relative c {
  \clef bass
  \key a \minor
  \time 4/4
  a8 e' a e  a, e' a e
    a, e' a e  a, e' a e |
  \repeat volta 2 {
    f, c' f c  f, c' f c |
    a8 e' a e  a, e' a e |
    f, c' f c  f, c' f c |
    c, g' c g  c, g' c g |
    e  b' e b  e, b' e b |
  }
  \alternative {
    {
      a  e' a e  a, e' a e |
      a, e' a e  a, e' a e |
    }
    {
      a, e' a e  a, e' a e |
      g, d' g d  g, d' g b |
    }
  }
  
  % Part B
  a, e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  c  g' c g  c, g' c g |
  g, d' g d  g, d' g d |
  
  a  e' a e  a, e' a e |
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
  
  a, e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  a  e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  a  e' a e  a, e' a e |
  f, c' f c  f, c' f c |
  \ottava #-1
  a, e' a e  a, e' a e |
  a, e' a c e2\fermata \ottava #0 \bar "|."
  
}

dynamics = \relative {
  s1 \mp |
  s2 s2 \< |
  s1\! |
  s1 |
  s1 |
  s2 s2\> |
  s1\! |
  s2  s2\< |
  s2\> s2\! |
  
  s2 s2\< |
  s1\! |
  
  % Part B
  s1\mp |
  s1 |
  s1 |
  s1 |
  
  s1 |
  s1 |
  s1 |
  s1 |
  
  s1\mf |
  s1 |
  s1 |
  s1 |
  
  s1 |
  s1 |
  s1\< |
  s1\> |
  
  s2\! s2\< |
  s1\! |
  s1 |
  s1 |
  s4\dim s2.\! |
  
  s1 |
  s1 |
  s1 \pp |
  s1-"rit." |
}

pedal = \relative {
  s2 \sustainOn s4. s8\sustainOff |
  s8 \sustainOn s4.^"simile" s2 |
}

\score {
  \new PianoStaff \with { instrumentName = "Piano" }
  <<
    \new Staff = "upper" \upper
    \new Dynamics = "" \dynamics
    \new Staff = "lower" \lower
    \new Dynamics = "" \pedal
  >>
  \layout { }
  \midi { }
}