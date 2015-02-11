ipython nbconvert --to markdown 20150209_IPerl_display_demo.ipynb

# ... edit the output file: 20150209_IPerl_display_demo.md

markdown2pod < 20150209_IPerl_display_demo.md > 20150209_IPerl_display_demo.pod

# ... edit the POD *sigh*

-------------

# Or try this

./hack-it-up.pl < 20150209_IPerl_display_demo.ipynb  > 20150209_IPerl_display_demo_hackitup.pod

