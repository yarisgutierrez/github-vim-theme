#!/usr/bin/env python3
"""Generate vim primitives + palettes from extracted JSON primitives."""
import json, os

EXTRACT = '/tmp/extract'
OUT_BASE = '/home/claude/github-vim-theme/autoload/github_theme'

def parse_hex(s):
    s = s.lstrip('#').lower()
    if len(s) == 3:
        s = ''.join(c*2 for c in s)
    if len(s) == 8:
        s = s[:6]
    return (int(s[0:2], 16), int(s[2:4], 16), int(s[4:6], 16))

def to_hex(rgb):
    r, g, b = [max(0, min(255, round(v))) for v in rgb[:3]]
    return '#%02x%02x%02x' % (r, g, b)

def blend(a_hex, b_hex, f):
    a = parse_hex(a_hex)
    b = parse_hex(b_hex) if isinstance(b_hex, str) else b_hex
    return to_hex(tuple((b[i] - a[i]) * f + a[i] for i in range(3)))

def rgba_rgb(r, g, b):
    return (r, g, b)

def load_prim(name):
    with open(os.path.join(EXTRACT, name + '.json')) as f:
        return json.load(f)

def pal_dark_generic(s, pl, prims, BG_hex, canvas_dict):
    return {
        'orange':  s['orange'][3],
        'black':   {'base': s['gray'][9], 'bright': s['gray'][8]},
        'gray':    {'base': s['gray'][4], 'bright': s['gray'][4]},
        'blue':    {'base': s['blue'][3], 'bright': s['blue'][2]},
        'green':   {'base': s['green'][3], 'bright': s['green'][2]},
        'magenta': {'base': s['purple'][3], 'bright': s['purple'][2]},
        'pink':    {'base': s['pink'][3], 'bright': s['pink'][2]},
        'red':     {'base': s['red'][3], 'bright': s['red'][2]},
        'white':   {'base': s['gray'][2], 'bright': s['gray'][2]},
        'yellow':  {'base': s['yellow'][3], 'bright': s['yellow'][2]},
        'cyan':    {'base': '#76e3ea', 'bright': '#b3f0ff'},
        'fg': {'default': '#e6edf3','muted': '#7d8590','subtle': s['gray'][4],'on_emphasis': s['white']},
        'canvas': dict(canvas_dict),
        'border': {'default': s['gray'][8],'muted': s['gray'][7],'subtle':  blend(BG_hex, rgba_rgb(240,246,252), 0.1)},
        'neutral': {'emphasis_plus': s['gray'][4],'emphasis': s['gray'][4],
                    'muted':  blend(BG_hex, rgba_rgb(110,118,129), 0.4),
                    'subtle': blend(BG_hex, rgba_rgb(110,118,129), 0.1)},
        'accent': {'fg': '#2f81f7','emphasis': s['blue'][5],
                   'muted':  blend(BG_hex, rgba_rgb(56,139,253), 0.4),
                   'subtle': blend(BG_hex, rgba_rgb(56,139,253), 0.15)},
        'success': {'fg': s['green'][3],'emphasis': s['green'][5],
                    'muted':  blend(BG_hex, rgba_rgb(46,160,67), 0.4),
                    'subtle': blend(BG_hex, rgba_rgb(46,160,67), 0.15)},
        'attention': {'fg': s['yellow'][3],'emphasis': s['yellow'][5],
                      'muted':  blend(BG_hex, rgba_rgb(187,128,9), 0.4),
                      'subtle': blend(BG_hex, rgba_rgb(187,128,9), 0.15)},
        'severe': {'fg': s['orange'][4],'emphasis': s['orange'][5],
                   'muted':  blend(BG_hex, rgba_rgb(219,109,40), 0.4),
                   'subtle': blend(BG_hex, rgba_rgb(219,109,40), 0.1)},
        'danger': {'fg': s['red'][4],'emphasis': s['red'][5],
                   'muted':  blend(BG_hex, rgba_rgb(248,81,73), 0.4),
                   'subtle': blend(BG_hex, rgba_rgb(248,81,73), 0.1)},
        'open': {'fg': s['green'][3],'emphasis': s['green'][5],
                 'muted':  blend(BG_hex, rgba_rgb(46,160,67), 0.4),
                 'subtle': blend(BG_hex, rgba_rgb(46,160,67), 0.15)},
        'done': {'fg': s['purple'][4],'emphasis': s['purple'][5],
                 'muted':  blend(BG_hex, rgba_rgb(163,113,247), 0.4),
                 'subtle': blend(BG_hex, rgba_rgb(163,113,247), 0.1)},
        'closed': {'fg': s['red'][4],'emphasis': s['red'][5],
                   'muted':  blend(BG_hex, rgba_rgb(248,81,73), 0.4),
                   'subtle': blend(BG_hex, rgba_rgb(248,81,73), 0.15)},
        'sponsors': {'fg': s['pink'][4],'emphasis': s['pink'][5],
                     'muted':  blend(BG_hex, rgba_rgb(219,97,162), 0.4),
                     'subtle': blend(BG_hex, rgba_rgb(219,97,162), 0.1)},
    }

def pal_light_generic(s, pl, prims, BG_hex, canvas_dict):
    return {
        'orange': s['orange'][3],
        'gray': s['gray'][5],
        'black':   {'base': s['gray'][9], 'bright': s['gray'][6]},
        'white':   {'base': s['gray'][5], 'bright': s['gray'][4]},
        'red':     {'base': s['red'][5], 'bright': s['red'][6]},
        'green':   {'base': s['green'][6], 'bright': s['green'][5]},
        'yellow':  {'base': s['yellow'][8], 'bright': s['yellow'][7]},
        'blue':    {'base': s['blue'][5], 'bright': s['blue'][4]},
        'magenta': {'base': s['purple'][5], 'bright': s['purple'][4]},
        'pink':    {'base': s['pink'][5], 'bright': s['pink'][4]},
        'cyan':    {'base': '#1b7c83', 'bright': '#3192aa'},
        'fg': {'default': s['black'],'muted':   s['gray'][2],'subtle':  s['gray'][5],'on_emphasis': s['white']},
        'canvas': dict(canvas_dict),
        'border': {'default': s['gray'][2],'muted': s['gray'][2],'subtle': blend(BG_hex, s['black'], 0.15)},
        'neutral': {'emphasis_plus': s['gray'][9],'emphasis': s['gray'][5],
                    'muted':  blend(BG_hex, s['gray'][3], 0.2),
                    'subtle': blend(BG_hex, s['gray'][1], 0.5)},
        'accent': {'fg': s['blue'][5],'emphasis': s['blue'][5],
                   'muted':  blend(BG_hex, s['blue'][3], 0.4),
                   'subtle': s['blue'][0]},
        'success': {'fg': s['green'][5],'emphasis': '#1f883d',
                    'muted':  blend(BG_hex, s['green'][3], 0.4),
                    'subtle': s['green'][0]},
        'attention': {'fg': s['yellow'][5],'emphasis': s['yellow'][5],
                      'muted':  blend(BG_hex, s['yellow'][3], 0.4),
                      'subtle': s['yellow'][0]},
        'severe': {'fg': s['orange'][5],'emphasis': s['orange'][5],
                   'muted':  blend(BG_hex, s['orange'][3], 0.4),
                   'subtle': s['orange'][0]},
        'danger': {'fg': '#d1242f','emphasis': s['red'][5],
                   'muted':  blend(BG_hex, s['red'][3], 0.4),
                   'subtle': s['red'][0]},
        'open': {'fg': s['green'][5],'emphasis': '#1f883d',
                 'muted':  blend(BG_hex, s['green'][3], 0.4),
                 'subtle': s['green'][0]},
        'closed': {'fg': '#d1242f','emphasis': s['red'][5],
                   'muted':  blend(BG_hex, s['red'][3], 0.4),
                   'subtle': s['red'][0]},
        'done': {'fg': s['purple'][5],'emphasis': s['purple'][5],
                 'muted':  blend(BG_hex, s['purple'][3], 0.4),
                 'subtle': s['purple'][0]},
        'sponsors': {'fg': s['pink'][5],'emphasis': s['pink'][5],
                     'muted':  blend(BG_hex, s['pink'][3], 0.4),
                     'subtle': s['pink'][0]},
    }

def pal_github_dark(s, pl, prims):
    BG = s['gray'][6]
    canvas = {'default': s['gray'][6],'overlay': s['gray'][8],'inset': s['gray'][7],'subtle':  s['gray'][8]}
    return pal_dark_generic(s, pl, prims, BG, canvas), BG

def pal_github_light(s, pl, prims):
    BG = s['white']
    canvas = {'default': s['white'],'overlay': s['white'],'inset': s['gray'][0],'subtle':  s['gray'][0]}
    return pal_light_generic(s, pl, prims, BG, canvas), BG

def pal_dark_from_canvas(s, pl, prims):
    BG = prims['canvas']['default']
    return pal_dark_generic(s, pl, prims, BG, prims['canvas']), BG

def pal_light_from_canvas(s, pl, prims):
    BG = prims['canvas']['default']
    return pal_light_generic(s, pl, prims, BG, prims['canvas']), BG

def pal_light_hc(s, pl, prims):
    BG = prims['canvas']['default']
    p = pal_light_generic(s, pl, prims, BG, prims['canvas'])
    p['border']['subtle'] = blend(BG, s['black'], 0.8)
    return p, BG

def spec_dark_std(pal, s, pl, BG):
    spec = {
        'bg0': blend(BG, pal['canvas']['inset'], 0.75),
        'bg1': pal['canvas']['default'],
        'bg2': blend(BG, pal['neutral']['emphasis'], 0.1),
        'bg3': s['gray'][5], 'bg4': s['gray'][3],
        'fg0': pal['fg']['subtle'], 'fg1': pal['fg']['default'],
        'fg2': pal['fg']['muted'], 'fg3': s['gray'][4],
        'sel0': blend(BG, pal['accent']['fg'], 0.30),
        'sel1': blend(BG, pal['accent']['muted'], 0.90),
        'sel2': blend(BG, s['yellow'][0], 0.20),
    }
    _fill_dark(spec, pal, s, pl, BG); return spec

def spec_light_std(pal, s, pl, BG):
    spec = {
        'bg0': pal['canvas']['inset'],
        'bg1': pal['canvas']['default'],
        'bg2': blend(BG, pal['neutral']['emphasis'], 0.1),
        'bg3': blend(BG, s['blue'][8], 0.1),
        'bg4': s['gray'][5],
        'fg0': pal['fg']['subtle'], 'fg1': pal['fg']['default'],
        'fg2': s['gray'][8], 'fg3': s['gray'][6],
        'sel0': blend(BG, pal['accent']['fg'], 0.15),
        'sel1': blend(BG, pal['accent']['muted'], 0.90),
        'sel2': blend(BG, pal['attention']['emphasis'], 0.3),
    }
    _fill_light(spec, pal, s, pl, BG); return spec

def _fill_dark(spec, pal, s, pl, BG):
    spec['syntax'] = {
        'bracket': spec['fg1'], 'builtin0': pl['syntax']['constant'],
        'builtin1': pl['syntax']['keyword'], 'builtin2': pl['syntax']['constant'],
        'comment': pl['syntax']['comment'], 'conditional': pl['syntax']['keyword'],
        'const': pl['syntax']['constant'], 'dep': s['red'][2],
        'field': pl['syntax']['constant'], 'func': pl['syntax']['entity'],
        'ident': spec['fg1'], 'keyword': pl['syntax']['keyword'],
        'number': pl['syntax']['constant'], 'operator': pl['syntax']['constant'],
        'param': spec['fg1'], 'preproc': pl['syntax']['keyword'],
        'regex': pl['syntax']['string'], 'statement': pl['syntax']['keyword'],
        'string': pl['syntax']['string'], 'type': pl['syntax']['variable'],
        'tag': pl['syntax']['entityTag'], 'variable': spec['fg1'],
    }
    spec['diag'] = {'error': pal['danger']['fg'],'warn': pal['attention']['fg'],
                    'info': pal['accent']['fg'],'hint': pal['fg']['muted']}
    spec['diag_bg'] = {k: blend(BG, v, 0.15) for k, v in spec['diag'].items()}
    spec['diff'] = {'add': blend(BG, s['green'][5], 0.15),
                    'delete': blend(BG, s['red'][5], 0.15),
                    'change': blend(BG, s['yellow'][5], 0.15),
                    'text': spec['fg0']}
    spec['git'] = {'add': pal['success']['fg'],'removed': pal['danger']['fg'],
                   'changed': pal['attention']['fg'],'conflict': pal['severe']['fg'],
                   'ignored': pal['fg']['subtle']}

def _fill_light(spec, pal, s, pl, BG):
    spec['syntax'] = {
        'bracket': spec['fg1'], 'builtin0': pl['syntax']['constant'],
        'builtin1': pl['syntax']['keyword'], 'builtin2': pl['syntax']['constant'],
        'comment': pl['syntax']['comment'], 'conditional': pl['syntax']['keyword'],
        'const': pl['syntax']['constant'], 'dep': s['red'][7],
        'field': pl['syntax']['constant'], 'func': pl['syntax']['entity'],
        'ident': spec['fg1'], 'keyword': pl['syntax']['keyword'],
        'number': pl['syntax']['constant'], 'operator': pl['syntax']['constant'],
        'param': spec['fg1'], 'preproc': pl['syntax']['keyword'],
        'regex': pl['syntax']['string'], 'statement': pl['syntax']['keyword'],
        'string': pl['syntax']['string'], 'type': pl['syntax']['variable'],
        'tag': pl['syntax']['entityTag'], 'variable': spec['fg1'],
    }
    spec['diag'] = {'error': pal['danger']['fg'],'warn': pal['attention']['fg'],
                    'info': pal['accent']['fg'],'hint': pal['fg']['muted']}
    spec['diag_bg'] = {k: blend(BG, v, 0.15) for k, v in spec['diag'].items()}
    spec['diff'] = {'add': blend(BG, s['green'][6], 0.3),
                    'delete': blend(BG, s['red'][6], 0.3),
                    'change': blend(BG, s['yellow'][6], 0.3),
                    'text': spec['fg0']}
    spec['git'] = {'add': pal['success']['fg'],'removed': pal['danger']['fg'],
                   'changed': pal['attention']['fg'],'conflict': pal['severe']['fg'],
                   'ignored': pal['fg']['subtle']}

THEMES = [
    ('github_dark',                'dark',                False, pal_github_dark,       spec_dark_std),
    ('github_dark_default',        'dark',                False, pal_dark_from_canvas,  spec_dark_std),
    ('github_dark_dimmed',         'dark_dimmed',         False, pal_dark_from_canvas,  spec_dark_std),
    ('github_dark_high_contrast',  'dark_high_contrast',  False, pal_dark_from_canvas,  spec_dark_std),
    ('github_dark_colorblind',     'dark_colorblind',     False, pal_dark_from_canvas,  spec_dark_std),
    ('github_dark_tritanopia',     'dark_tritanopia',     False, pal_dark_from_canvas,  spec_dark_std),
    ('github_light',               'light',               True,  pal_github_light,      spec_light_std),
    ('github_light_default',       'light',               True,  pal_light_from_canvas, spec_light_std),
    ('github_light_high_contrast', 'light_high_contrast', True,  pal_light_hc,          spec_light_std),
    ('github_light_colorblind',    'light_colorblind',    True,  pal_light_from_canvas, spec_light_std),
    ('github_light_tritanopia',    'light_tritanopia',    True,  pal_light_from_canvas, spec_light_std),
]

def emit_vim_value(v, indent=2):
    if isinstance(v, dict):
        return emit_vim_dict(v, indent)
    if isinstance(v, list):
        return '[' + ', '.join(emit_vim_value(x, indent) for x in v) + ']'
    if isinstance(v, str):
        return "'" + v.replace("'", "''") + "'"
    if isinstance(v, bool):
        return 'v:true' if v else 'v:false'
    if isinstance(v, (int, float)):
        return str(v)
    if v is None:
        return 'v:null'
    raise TypeError('unsupported: %r' % type(v))

def emit_vim_dict(d, indent=2):
    if not d:
        return '{}'
    lines = ['{']
    pad = ' ' * indent
    items = list(d.items())
    for i, (k, v) in enumerate(items):
        comma = ',' if i < len(items) - 1 else ''
        lines.append('%s\\ ' % pad + "'" + str(k) + "': " + emit_vim_value(v, indent + 2) + comma)
    lines.append('%s\\ }' % (' ' * max(0, indent - 2)))
    return '\n'.join(lines)

def emit_primitives_file(name, data):
    out = {'scale': data.get('scale', {}), 'prettylights': data.get('prettylights', {})}
    if 'canvas' in data:
        out['canvas'] = data['canvas']
    return '\n'.join([
        '" autoload/github_theme/palette/primitives/%s.vim' % name,
        '" AUTO-GENERATED from projekt0n/github-nvim-theme primitives. Do not edit.',
        '',
        'function! github_theme#palette#primitives#%s#get() abort' % name,
        '  return ' + emit_vim_value(out, 4),
        'endfunction',
        '',
    ])

def emit_palette_file(theme_name, pal_dict, spec_dict, meta, scale):
    pal_with_scale = dict(pal_dict)
    pal_with_scale['scale'] = scale
    return '\n'.join([
        '" autoload/github_theme/palette/%s.vim' % theme_name,
        '" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.',
        '"',
        '" Public API:',
        '"   github_theme#palette#%s#meta() -> {name, light}' % theme_name,
        '"   github_theme#palette#%s#get()  -> palette dict' % theme_name,
        '"   github_theme#palette#%s#spec() -> spec dict (includes .palette)' % theme_name,
        '',
        'function! github_theme#palette#%s#meta() abort' % theme_name,
        '  return ' + emit_vim_value(meta, 4),
        'endfunction',
        '',
        'function! github_theme#palette#%s#get() abort' % theme_name,
        '  return ' + emit_vim_value(pal_with_scale, 4),
        'endfunction',
        '',
        'function! github_theme#palette#%s#spec() abort' % theme_name,
        '  let l:spec = ' + emit_vim_value(spec_dict, 4),
        "  let l:spec.palette = github_theme#palette#" + theme_name + "#get()",
        "  let l:spec.bg = l:spec.bg1",
        "  let l:spec.fg = l:spec.fg1",
        "  return l:spec",
        'endfunction',
        '',
    ])

def main():
    os.makedirs(os.path.join(OUT_BASE, 'palette', 'primitives'), exist_ok=True)
    prim_names = sorted(set(t[1] for t in THEMES))
    for pn in prim_names:
        data = load_prim(pn)
        with open(os.path.join(OUT_BASE, 'palette', 'primitives', pn + '.vim'), 'w') as f:
            f.write(emit_primitives_file(pn, data))
    print('primitives written: %d' % len(prim_names))
    print()
    print('%-33s %-7s %-7s %-7s %-7s %-7s' % ('theme', 'BG', 'bg0', 'bg1', 'sel0', 'accent'))
    for (tname, pname, is_light, pfn, sfn) in THEMES:
        data = load_prim(pname)
        s = data['scale']; pl = data['prettylights']
        pal, BG = pfn(s, pl, data)
        spec = sfn(pal, s, pl, BG)
        meta = {'name': tname, 'light': is_light}
        with open(os.path.join(OUT_BASE, 'palette', tname + '.vim'), 'w') as f:
            f.write(emit_palette_file(tname, pal, spec, meta, s))
        print('%-33s %-7s %-7s %-7s %-7s %-7s' % (tname, BG, spec['bg0'], spec['bg1'], spec['sel0'], pal['accent']['fg']))

if __name__ == '__main__':
    main()
