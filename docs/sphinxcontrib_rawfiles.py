# -*- coding: utf-8 -*-
import os
import shutil

def on_html_collect_pages(app):
    for f in app.builder.config.rawfiles:
        src = os.path.join(app.srcdir, f)
        dst = os.path.join(app.builder.outdir, f)
        if os.path.isfile(src):
            shutil.copy(src, dst)
        else:
            shutil.copytree(src, dst)

    return ()

def setup(app):
    app.add_config_value('rawfiles', [], 'html')
    app.connect("html-collect-pages", on_html_collect_pages)
