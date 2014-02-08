import com.dorisoft.autocomplete.Book
import org.apache.commons.lang.RandomStringUtils
import org.apache.commons.lang.math.RandomUtils

class BootStrap {

    def init = { servletContext ->

        //RandomUtils r = new RandomUtils()

        def z = { l -> return RandomStringUtils.random(l, (('A'..'E') + ' ').join().toCharArray()) }
        def rnd = { l -> return RandomUtils.nextInt(l) }

        if (!Book.count()) {
            println "Loading data"

            (1..10).each {
                new Book(name: z(it), pages: rnd(it), published: new Date() + it, price: it * 12.4).save(flush: true)
            }
        }
    }
    def destroy = {
    }
}
