FROM nhsdigitalmait/tkw-x:350ecba
ARG USER_ID

RUN useradd -rm -u $USER_ID service
RUN mkdir /home/service/data/ && chown service:service /home/service/data/
VOLUME /home/service/data
VOLUME /home/service/certs
VOLUME /home/service/external_configuration
COPY . /home/service/TKW/config/SPINE_MTH_EPS_Dispenser_Simulator
WORKDIR /home/service/TKW/config/SPINE_MTH_EPS_Dispenser_Simulator
#RUN mkdir /home/service/TKW/config/SPINE_MTH_EPS_Dispenser_Simulator/simulator_saved_messages/
RUN mkdir /home/service/TKW/config/SPINE_MTH_EPS_Dispenser_Simulator/messages_for_validation/
RUN sh set-all-configurations.sh

ENV trustStore=default
ENV trustStorePassword=default
ENV keyStore=default
ENV keyStorePassword=default
USER service
ENTRYPOINT ["bash", "runtkwentrypoint.sh"]

