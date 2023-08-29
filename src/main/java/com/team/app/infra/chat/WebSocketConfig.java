package com.team.app.infra.chat;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;

import java.util.List;

@EnableWebSocketMessageBroker
@Configuration
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/websocket").withSockJS();
    }

    @Override
    public void configureWebSocketTransport(WebSocketTransportRegistration registry) {

    }

    @Override
    public void configureClientInboundChannel(org.springframework.messaging.simp.config.ChannelRegistration registration) {

    }

    @Override
    public void configureClientOutboundChannel(org.springframework.messaging.simp.config.ChannelRegistration registration) {

    }

    @Override
    public void addArgumentResolvers(List<org.springframework.messaging.handler.invocation.HandlerMethodArgumentResolver> argumentResolvers) {

    }

    @Override
    public void addReturnValueHandlers(List<org.springframework.messaging.handler.invocation.HandlerMethodReturnValueHandler> returnValueHandlers) {

    }

    @Override
    public boolean configureMessageConverters(List<org.springframework.messaging.converter.MessageConverter> messageConverters) {
        return false;
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/topic");

    }
}