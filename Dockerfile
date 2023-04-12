# Dockerfile
FROM metaboprep
RUN pip install numpy
COPY ./VRE_Tool.py /vre_template_tool/tool/VRE_Tool.py
RUN cp -r /vre_template_tool/metaboprep/* /vre_template_tool/tool/
COPY ./metaboprep_Report_v0.Rmd /usr/local/lib/R/site-library/metaboprep/rmarkdown/metaboprep_Report_v0.Rmd
#RUN Rscript /requirements.R
