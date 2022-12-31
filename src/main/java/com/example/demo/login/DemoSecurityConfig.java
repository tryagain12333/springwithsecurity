package com.example.demo.login;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity

public class DemoSecurityConfig {
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests()
				.antMatchers("/").hasRole("EMPLOYEE")
				.antMatchers("/value/**").hasRole("ADMIN")
				.and()
				.formLogin()
				.loginPage("/showMyLoginPage")
				.loginProcessingUrl("/")
				.permitAll()
				.and()
				.logout().permitAll()
				.and()
				.exceptionHandling().accessDeniedPage("/access-denied");

		return http.build();
	}

	@Bean
	public UserDetailsService userDetailsService() {
		// The builder will ensure the passwords are encoded before saving in memory
		UserDetails user = User.builder().username("user").password("{noop}1234").roles("USER").build();
		UserDetails admin = User.builder().username("gmanh").password("{noop}1234").roles("USER", "ADMIN").build();
		return new InMemoryUserDetailsManager(user, admin);
	}
}
