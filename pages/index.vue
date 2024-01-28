<template>
    <div class="flex flex-col gap-8 grow">
        <UCard>
            <template #header>
                SCD30 Senerion Sensor
            </template>

            <div v-if="pendingSCD30">
                <UProgress animation="carousel" />
            </div>

            <div v-else>
                <div class="flex flex-col gap-2">
                    <UMeter color="primary" :value="SCD30?.co2Concentration" label="CO2 Concentration" :max="3000" :min="0">
                        <template #indicator>
                            <div class="font-black text-right">
                                {{ SCD30?.co2Concentration.toFixed(0) }}
                            </div>
                        </template>
                    </UMeter>

                    <UMeter color="primary" :value="SCD30?.relativeHumidity" label="Relative Humidity" :max="100" :min="0">
                        <template #indicator>
                            <div class="font-black text-right">
                                {{ SCD30?.relativeHumidity.toFixed(0) }}
                            </div>
                        </template>
                    </UMeter>

                    <UMeter color="primary" :value="SCD30?.temperature" label="Temperature" :max="100" :min="-100">
                        <template #indicator>
                            <div class="font-black text-right">
                                {{ SCD30?.temperature.toFixed(0) }}
                            </div>
                        </template>
                    </UMeter>
                </div>
            </div>

            <template #footer>
                <UButton icon="i-ph-arrows-clockwise-duotone" @click="refreshSCD30()">Refresh SCD30</UButton>
            </template>
        </UCard>

        <UCard>
            <template #header>
                W1 Thermsensors
            </template>

            <div v-if="pendingW1">
                <UProgress animation="carousel" />
            </div>

            <div v-else class="flex flex-col gap-2">
                <div v-for="data in W1?.sensors">
                    <UMeter color="blue" :value="data.temperature" :label="data.sensor" :max="100" :min="-40">
                        <template #indicator>
                            <div class="font-black text-right">
                                {{ data.temperature.toFixed(0) }}
                            </div>
                        </template>
                    </UMeter>
                </div>
            </div>

            <template #footer>
                <UButton icon="i-ph-arrows-clockwise-duotone" @click="refreshW1()">Refresh W1</UButton>
            </template>
        </UCard>

        <UCard>
            <template #header>
                GPIO Test
            </template>


            <div class="flex flex-col gap-2">
                {{ testSwitch }}
                <UToggle name="Test" v-model="testSwitch" />

            </div>

        </UCard>
    </div>
</template>

<script setup lang="ts">
import { type SCD30Response, type W1SensorResponseList } from '~/__api__'
// const w1 = await useFetch('http://raspberrypi.local:3000/w1')
const { pending: pendingSCD30, data: SCD30, refresh: refreshSCD30 } = await useLazyFetch<SCD30Response>('http://raspberrypi.local:3000/scd30')
const { pending: pendingW1, data: W1, refresh: refreshW1 } = await useLazyFetch<W1SensorResponseList>('http://raspberrypi.local:3000/w1')

const { pending: pendingGPIO, data: gpio, execute } = await useLazyFetch<W1SensorResponseList>('http://raspberrypi.local:3000/gpio', { method: 'PUT', params: {pin: 29, on: 'on'} })

const testSwitch = ref(false)
watch(testSwitch, () => {
    execute()
})
// watch(scd30, (newPosts) => {
//   // Because posts might start out null, you won't have access
//   // to its contents immediately, but you can watch it.
// })
</script>