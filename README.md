```shell
ipython nbconvert --to markdown 20150209_IPerl_display_demo.ipynb
```

... edit the output file: 20150209_IPerl_display_demo.md

```shell
markdown2pod < 20150209_IPerl_display_demo.md > 20150209_IPerl_display_demo.pod
```

... edit the POD *sigh*

-------------

Or try this

```shell
./hack-it-up.pl < 20150209_IPerl_display_demo.ipynb  > 20150209_IPerl_display_demo_hackitup.pod
pod2html 20150209_IPerl_display_demo_hackitup.pod > 20150209_IPerl_display_demo_hackitup.html
see 20150209_IPerl_display_demo_hackitup.html
```

