<template>
    <div>
        <div>
            <!-- <pre>{{ w1.data.value }}</pre> -->
            <Breadcrumb :links="[{ label: 'asdfa' }]" />

            <div class="p-4">
                <div v-if="pendingSCD30">
                    <UProgress animation="carousel" />
                    Loading SCD30 ...
                </div>

                <div v-else>
                    <ul class="p-4 flex flex-col gap-1">
                        <li>co2Concentration: {{ SCD30?.co2Concentration }}</li>
                        <li>relativeHumidity: {{ SCD30?.relativeHumidity }}</li>
                        <li>temperature: {{ SCD30?.temperature }}</li>
                    </ul>
                </div>
            </div>

            <button @click="refreshSCD30()">Refresh SCD30</button>
        </div>

        <div>
            <div v-if="pendingW1">
                <UProgress animation="carousel" />
                Loading W1 ...
            </div>

            <div v-else>
                <div v-for="data in W1">
                    {{ W1?.sensor }}
                    <!-- <UMeter color="primary" :value="data.temperature" indicator :label="data.sensor" :max="100" :min="-40" /> -->
                    {{ data }}
                </div>
            </div>

            <button @click="refreshW1()">Refresh W1</button>
        </div>
    </div>
</template>

<script setup lang="ts">
import { type SCD30Response, type W1SensorResponse } from '~/__api__'
// const w1 = await useFetch('http://raspberrypi.local:3000/w1')
const { pending: pendingSCD30, data: SCD30, refresh: refreshSCD30 } = await useLazyFetch<SCD30Response>('http://raspberrypi.local:3000/scd30')
const { pending: pendingW1, data: W1, refresh: refreshW1 } = await useLazyFetch<W1SensorResponse>('http://raspberrypi.local:3000/w1')
// watch(scd30, (newPosts) => {
//   // Because posts might start out null, you won't have access
//   // to its contents immediately, but you can watch it.
// })
</script>