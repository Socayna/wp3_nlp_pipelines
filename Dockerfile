# Dockerfile
FROM metaboprep
RUN pip install numpy mdpdf
RUN apt update -y && apt install -y  bindfs sudo

COPY ./VRE_Tool.py /vre_template_tool/tool/VRE_Tool.py
RUN cp -r /vre_template_tool/metaboprep/* /vre_template_tool/tool/
COPY ./run_metaboprep_pipeline.R /vre_template_tool/tool/

COPY ./metaboprep_Report_v0.Rmd /usr/local/lib/R/site-library/metaboprep/rmarkdown/metaboprep_Report_v0.Rmd
#RUN Rscript /requirements.R

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

