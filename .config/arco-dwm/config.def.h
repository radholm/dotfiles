/* See LICENSE file for copyright and license details. */

/* Constants */
#define TERMINAL "st"

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const int startwithgaps[]    = { 1 };	/* 1 means gaps are used by default, this can be customized for each tag */
static const unsigned int gappx[]   = { 256 };   /* default gap between windows in pixels, this can be customized for each tag */
//static const unsigned int gappx     = 32;       /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 0;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 0;     	/* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int user_bh	          = 22;
static const Bool viewontag         = True;     /* Switch view on tag switch */
static const char *fonts[]          = { "hack:size=9", "fontawesome:size=9" };
static const char dmenufont[]       = "hack:size=9";
static const char normbgcolor[]     = "#2A313B";
static const char normbordercolor[] = "#2A313B";
static const char normfgcolor[]     = "#c0c0c0";
static const char selfgcolor[]      = "#e8e8e8";
static const char selbordercolor[]  = "#404040";
static const char selbgcolor[]      = "#2A313B";
static const unsigned int baralpha  = 0xFF;
static const unsigned int borderalpha = 0xFF;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { normfgcolor,	normbgcolor, 	normbordercolor },
	[SchemeSel]  = { selfgcolor,	selbgcolor,  	selbordercolor  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },

	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 *  use tags mask to point an application to a specific workspace
	 */
	/* class                       instance    title      tags mask      isfloating   monitor */
	{ "Gimp",                      NULL,       NULL,       0,            0,           -1 },
	{ "Xfce4-terminal",            NULL,       NULL,       0,            1,           -1 },
	{ "firefox",                   NULL,       NULL,       0,            0,           -1 },
	{ "Arcolinux-welcome-app.py",  NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "layouts.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "T",        tile },    /* first entry is default */
	{ "G",	      grid },
	{ "M",	      monocle },
	{ "C",	      centeredmaster },
	{ "CF",	      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *filecmd[]  = { "thunar", NULL };
static const char *calendar[]  = { "gsimplecal", NULL };
static const char *taskmanager[]  = { "xfce4-taskmanager", NULL };
static const char *web[] = { "qutebrowser", NULL };
static const char *terminal[] = { TERMINAL , NULL };

#include "selfrestart.c"
#include "shiftview.c"


static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = filecmd } },
	{ MODKEY,			                  XK_w,	     spawn,	         {.v = web } },
	{ MODKEY,			                  XK_Return, spawn,	         {.v = terminal } },
	{ MODKEY,			                  XK_r,	     spawn,	         SHCMD(TERMINAL " -e lf") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Right,  focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       0x002d,    setgaps,        {.i = -5} },
	{ MODKEY,                       0x002b,    setgaps,        {.i = +5} },
  { MODKEY|ShiftMask,             0x002d,    setgaps,        {.i = GAP_RESET } },
  { MODKEY|ShiftMask,             0x002b,    setgaps,        {.i = GAP_TOGGLE} },
	/*{ MODKEY,                       XK_Return, zoom,           {0} },*/
	/*{ MODKEY,                       XK_Tab,    view,           {0} },*/
	{ MODKEY,			                  XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,			                  XK_u,	     setlayout,	     {.v = &layouts[3]} },
	{ MODKEY,			                  XK_o,	     setlayout,	     {.v = &layouts[4]} },
	{ MODKEY|ControlMask,		        XK_comma,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },
	{ MODKEY,                       XK_space,  cyclelayout,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_r,      self_restart,   {0} },
	{ Mod1Mask|ControlMask,         XK_Right,  shiftview,      {.i =  1 } },
	{ Mod1Mask|ControlMask,         XK_Left,   shiftview,      {.i = -1 } },
	{ Mod1Mask|ControlMask,         XK_Up,     shiftview,      {.i =  1 } },
	{ Mod1Mask|ControlMask,         XK_Down,   shiftview,      {.i = -1 } },	
	{ Mod1Mask,			                XK_Tab,    shiftview,      {.i =  1 } },
	{ Mod1Mask|ShiftMask,	          XK_Tab,	   shiftview,	     {.i = -1 } },
	{ MODKEY,		                    XK_Tab,    shiftview,	     {.i =  1 } },
	{ MODKEY|ShiftMask,		          XK_Tab,	   shiftview,	     {.i = -1 } },


	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        spawn,          {.v = taskmanager } },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = filecmd } },
	{ ClkStatusText,        0,              Button3,        spawn,          {.v = calendar } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
