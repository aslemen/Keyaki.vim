# -*- coding: utf-8 -*-

from cm import register_source
register_source(name='Keyaki',
        abbreviation='Kyk',
        scoping=True,
        scopes=['penn'],
        priority=9)

import re

class Source:
    def __init__(self,nvim):
        self._nvim = nvim

    def cm_refresh(self,info,ctx):
        matches = ['NP','VP']
        self._nvim.call('cm#complete', info['name'], ctx, ctx['startcol'], matches, async=True)
