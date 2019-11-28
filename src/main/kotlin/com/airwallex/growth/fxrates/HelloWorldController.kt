package com.airwallex.growth.fxrates

import org.slf4j.LoggerFactory
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloWorldController {

    val logger = LoggerFactory.getLogger(HelloWorldController::class.java)

    @GetMapping("/helloworld")
    fun greeting(@RequestParam(value = "name", defaultValue = "Jack") name: String) {
        logger.info("in greeting function")
        logger.info("Hello $name")

        "Hello $name"
    }


}