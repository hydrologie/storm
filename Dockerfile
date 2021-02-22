FROM continuumio/miniconda3

ADD /binder/environment.yml /binder/environment.yml

RUN conda env create -f /binder/environment.yml
ENV PATH /opt/conda/envs/storm/bin:$PATH
RUN /bin/bash -c "source activate storm"

RUN jupyter nbextension enable --py --sys-prefix appmode
RUN jupyter serverextension enable --py --sys-prefix appmode

EXPOSE 8888
CMD ["jupyter-notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]